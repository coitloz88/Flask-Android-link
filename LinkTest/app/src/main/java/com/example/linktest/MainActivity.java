package com.example.linktest;

import androidx.appcompat.app.AppCompatActivity;
import androidx.work.ExistingPeriodicWorkPolicy;
import androidx.work.PeriodicWorkRequest;
import androidx.work.WorkManager;
import androidx.work.WorkRequest;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.HttpHeaderParser;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.concurrent.TimeUnit;

public class MainActivity extends AppCompatActivity {

    public static RequestQueue requestQueue;

    private static final String TAG = "MainActivity";
    private final int GETDATA = 0;
    private final int SENDDATA = 1;

    private TextView tv_getdata;
    private EditText et_email;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        tv_getdata = findViewById(R.id.tv_getdata);
        et_email = findViewById(R.id.et_email);

        requestQueue = Volley.newRequestQueue(getApplicationContext());

        Button btn_getdata = findViewById(R.id.btn_getdata);
        btn_getdata.setOnClickListener(new Button.OnClickListener(){
            @Override
            public void onClick(View view) {
                PeriodicWorkRequest getWorkRequest = new PeriodicWorkRequest.Builder(IncentiveWork.class, 15, TimeUnit.MINUTES).build();
                WorkManager.getInstance(getApplicationContext()).enqueueUniquePeriodicWork("GetNewIncentiveWork", ExistingPeriodicWorkPolicy.KEEP, getWorkRequest);
                Toast.makeText(MainActivity.this, "Start to get incentive periodically", Toast.LENGTH_SHORT).show();
            }
        });

        Button btn_stopdata = findViewById(R.id.btn_stopget);
        btn_stopdata.setOnClickListener(new View.OnClickListener(){

            @Override
            public void onClick(View view) {
                WorkManager.getInstance(getApplicationContext()).cancelUniqueWork("GetNewIncentiveWork");
                Toast.makeText(MainActivity.this, "Stop to get incentive", Toast.LENGTH_SHORT).show();
            }
        });

        Button btn_senddata = findViewById(R.id.btn_senddata);
        btn_senddata.setOnClickListener(new Button.OnClickListener(){
            @Override
            public void onClick(View view) {
                makeRequest(SENDDATA);
            }
        });

        if (requestQueue == null) {
            requestQueue = Volley.newRequestQueue(getApplicationContext());
        }
    }

    private void makeRequest(int type) {
        String url = "http://143.248.96.4:5000";
        StringRequest request;

        //TODO: response listener, error listener는 따로 
        switch (type){
            case GETDATA:
                url += "/sample";
                request = new StringRequest(
                        Request.Method.GET,
                        url,
                        new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                Log.d(TAG, "응답 -> " + response);
                                tv_getdata.setText("받은 메시지" + response);
                            }
                        },
                        new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                Log.e(TAG, "에러 -> " + error.getMessage());
                                Toast.makeText(getApplicationContext(), error.getMessage(), Toast.LENGTH_SHORT).show();
                            }
                        }
                );
                break;
            case SENDDATA:
                JSONObject jsonBody = new JSONObject();
                if(et_email.getText().toString().isEmpty()){
                    return;
                } else {
                    try {
                        jsonBody.put("id", et_email.getText().toString());
                        jsonBody.put("time", new Timestamp(System.currentTimeMillis()).toString());
                    } catch (JSONException e) {
                        e.printStackTrace();
                        return;
                    }
                }

                final String requestBody = jsonBody.toString();

                url += "/post";
                request = new StringRequest(
                        Request.Method.POST,
                        url,
                        new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                Log.d(TAG, "응답 -> " + response);
                                tv_getdata.setText(response);
                            }
                        },
                        new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                Log.e(TAG, "에러 -> " + error.getMessage());
                                Toast.makeText(getApplicationContext(), error.getMessage(), Toast.LENGTH_SHORT).show();
                            }
                        }
                ){
                    @Override
                    public String getBodyContentType() {
                        return "application/json; charset=utf-8";
                    }

                    @Override
                    public byte[] getBody() throws AuthFailureError {
                        try{
                            return requestBody == null? null: requestBody.getBytes("utf-8");
                        } catch (UnsupportedEncodingException e) {
                            e.printStackTrace();
                            return null;
                        }
                    }

                    @Override
                    protected Response<String> parseNetworkResponse(NetworkResponse response) {
                        String responseString = "";
                        if (response != null) {
                            responseString = String.valueOf(response.statusCode);
                        }
                        return Response.success(responseString, HttpHeaderParser.parseCacheHeaders(response));
                    }
                };
                break;
            default:
                Log.e(TAG,"unknown type");
                return;
        }

        requestQueue.add(request);
    }
}
