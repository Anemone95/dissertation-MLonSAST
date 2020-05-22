String p = request.getParameter("p");
URL u = new URL(p);
Boolean b = isInnerIP(u);
if (b) return;
u.openConnection();
