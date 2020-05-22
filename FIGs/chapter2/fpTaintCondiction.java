String p = request.getParameter("p");
String q =
    "http://www.baidu.com/s/"+p;
URL u = new URL(q);
u.openConnection();
