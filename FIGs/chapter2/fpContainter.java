String p = request.getParamter("p");
Map<String, String> map =
    new HashMap<>();
map.put("p",p);
map.put("b","clean");
String q=map.get("b");
response.getWriter().print(q);
