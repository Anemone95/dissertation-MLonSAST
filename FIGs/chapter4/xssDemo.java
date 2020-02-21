public class XSS extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException {
        String p = request.getParameter("p");
        String q;
        if (p.startsWith("safe")) {
            q=safe(p);
            sink(response, q);
        } else {
            q=unsafe(p);
            sink(response, q);
        }
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws  IOException {
        String p = request.getParameter("p");
        sink(response, safe(p));
    }
    public String safe(String s) {
        String r = s.replace("&", "&amp;").replace("<", "&lt;")
            .replace(">", "&gt;").replace(" ", "&nbsp;")
            .replace("\"", "&#34;").replace("'", "&#39;");
        return r;
    }
    public String unsafe(String s) {
        if (s.equals("clean")){
            return "clean";
        }  else {
            return s;
        }
    }
    public static void sink(HttpServletResponse response, String s)
            throws IOException {
            response.getWriter().write(s);
    }
}
