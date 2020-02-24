taskl () {
  task projects | awk '
    {
      if(($0 != "") &&
         (substr($0,0,2) != "  ") &&
         ($1 != "Project") &&
         (substr($1,0,1) != "-") &&
         ($2 != "projects"))
      {
        system("task list project:"$1);
      }
    }'
}
