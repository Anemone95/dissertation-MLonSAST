String sqlFilter(String s){
    String[] illegals = new String[]{
       "\"", "\\", /*...*/, "(", ")"};
    for(String e: illegals)
        s=s.replace(e,"");
    return s;
}
