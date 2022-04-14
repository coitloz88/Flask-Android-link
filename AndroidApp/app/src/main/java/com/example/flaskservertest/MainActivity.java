package com.example.flaskservertest;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Response.Listener<String> rplsn = new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                ((TextView) findViewById(R.id.tv_test_message)).setText(response.toString());

                if(false) try {
                    JSONObject jsonObject = new JSONObject(response);
                    ((TextView) findViewById(R.id.tv_test_message)).setText(jsonObject.getString("title"));
                } catch (JSONException e) {
                    Toast.makeText(getApplicationContext(), "Err ErrorListener:" + e, Toast.LENGTH_SHORT).show();
                }
            }
        };

        Response.ErrorListener errlsn = new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(MainActivity.this, "Err ErrorListener:" + error.toString(), Toast.LENGTH_SHORT).show();
            }
        };

        //String URL = "https://jsonplaceholder.typicode.com/todos/1";
        String URL = "http://10.0.2.2:5000";
        StringRequest req = new StringRequest(Request.Method.GET, URL, rplsn, errlsn);
        RequestQueue rq = Volley.newRequestQueue(MainActivity.this);
        rq.add(req);

    }
}