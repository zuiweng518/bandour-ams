package com.bandour.ams.utils;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

public class HttpClient {
    private static final String TOKEN_API = "/rest/token/getToken";

    public String getInfo(Map<String, String> map) {
        Map<String, String> tokenMap = new HashMap<String, String>();
        tokenMap.put("app_code", map.get("app_code"));
        tokenMap.put("app_secret", map.get("app_secret"));
        tokenMap.put("url", map.get("url"));
        String token = getToken(tokenMap);
        JSONObject json = new JSONObject(token);
        token = json.get("content").toString();
        map.put("token", token);
        return httpclient(map, "POST");
    }

    public String getToken(Map<String, String> map) {
        map.put("api", TOKEN_API);
        String content = httpclient(map, "GET");
        return content;
    }

    public String httpclient(Map<String, String> map, String requestMethod) {
        URL uri;
        HttpURLConnection httpConnection = null;
        StringBuilder sbu = new StringBuilder();
        InputStream is = null;
        BufferedReader bs = null;
        String line = "";
        try {
            uri = new URL(map.get("url") + map.get("api"));
            httpConnection = (HttpURLConnection) uri.openConnection();
            if ("POST".equals(requestMethod)) {
                httpConnection.setDoOutput(true);   //需要输出
                httpConnection.setDoInput(true);
            }
            httpConnection.setRequestMethod(requestMethod);//需要输入
            httpConnection.setUseCaches(false);
            httpConnection.addRequestProperty("app_code", map.get("app_code"));
            httpConnection.addRequestProperty("app_secret", map.get("app_secret"));
            map.remove("app_code");
            map.remove("app_secret");
            map.remove("api");
            map.remove("url");
            if (map.containsKey("token"))
                httpConnection.addRequestProperty("token", map.get("token"));
            map.remove("token");
            if (!map.isEmpty()) {
                DataOutputStream dos = new DataOutputStream(httpConnection.getOutputStream());
                StringBuilder param = new StringBuilder();
                for (String key : map.keySet()) {
                    param.append(key + "=" + map.get(key) + "&");
                }
                dos.writeBytes(param.toString());
                dos.flush();
                dos.close();
            }


            is = httpConnection.getInputStream();
            bs = new BufferedReader(new InputStreamReader(is));
            while ((line = bs.readLine()) != null) {
                sbu.append(line);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                is.close();
                bs.close();
                httpConnection.disconnect();
            } catch (Exception e) {

            }

        }
        return sbu.toString();
    }
}

