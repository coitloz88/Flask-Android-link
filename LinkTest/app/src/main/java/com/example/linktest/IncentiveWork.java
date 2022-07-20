package com.example.linktest;

import static com.example.linktest.MainActivity.requestQueue;

import android.content.Context;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.work.Worker;
import androidx.work.WorkerParameters;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

public class IncentiveWork extends Worker {

    private String TAG = "IncentiveWork";
    private final int[] incentive = {10};

    public IncentiveWork(@NonNull Context context, @NonNull WorkerParameters workerParams) {
        super(context, workerParams);
    }

    @NonNull
    @Override
    public Result doWork() {
        getNewIncentive("http://143.248.96.4:5000/sample");
        return Result.success();
    }

    private void getNewIncentive(String serverUrl){
        //TODO: check final array
        if(requestQueue == null){
            requestQueue = Volley.newRequestQueue(getApplicationContext());
        }

        StringRequest request = new StringRequest(
                Request.Method.GET,
                serverUrl,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.d(TAG, "응답 -> " + response);
                        try {
                            JSONObject jsonObject = new JSONObject(response);
                            if(jsonObject.has("next_incentive")){
                                incentive[0] = jsonObject.getInt("next_incentive");
                                Log.d(TAG, "new incentive given from server: " + incentive[0]);
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }

                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Log.e(TAG, "에러 -> " + error.getMessage());
                    }
                }
        );

        requestQueue.add(request);
    }


}
