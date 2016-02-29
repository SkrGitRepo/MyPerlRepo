// Build a bird-crumb trail to display at the top each page
var trailMenu = new Object();
trailMenu["start_here"] = "Start Here";
trailMenu["howtos"]     = "HOWTOs";
trailMenu["tutorials"]  = "Tutorials";
// faqs
trailMenu["faqs"]               = "FAQs";
trailMenu["documentation"]      = "Documentation";
trailMenu["flow_of_control"]    = "Flow Of Control";
trailMenu["manipulating_text"]  = "Manipulating Text";
trailMenu["variables"]          = "Variables";
trailMenu["file_io"]            = "File I/O";
trailMenu["perl_thinking"]      = "Perl Thinking";
trailMenu["perl_variables"]     = "Perl Variables";
trailMenu["references"]         = "References";
trailMenu["regexp"]             = "Regular Expression";
trailMenu["system"]             = "System and OS";
trailMenu["www"]                = "The World Wide Web";
trailMenu["datetime"]           = "Date and Time";

function makeTrailMenu() {
  var parseStart = 0;
  var parseEnd;
  var volDelim = "/";
  var output = 
    "<span style='font-family:Arial, Helvetica, sans-serif; font-size:12px;" +
    "color:#000000; padding:4px; float: left;'>";
  var linkStyle = "color:339966";
  var path = location.pathname;
  var separator = "&nbsp;&raquo;&nbsp;";
  var re = /\\/g;
  path = path.replace(re, "/");
  var trail = location.protocol + "//" + location.hostname;
  var leaves = path.split("/");
  if (leaves[leaves.length-1] == "" || 
      leaves[leaves.length-1] == "index.html" ||
      leaves[leaves.length-1] == "default.html") {
    //parseStart = 1;
    parseEnd = leaves.length -1;
  } else {
    parseEnd = leaves.length;
  }
  for (var i = parseStart; i < parseEnd; i++) {
    if (leaves[i] == 5 || leaves[i] == 6) {
        continue;
    } 
    if (i == parseStart) {
      //trail += "/" + leaves[i] + volDelim;
      trail += leaves[i] + volDelim;
      output += "<a href='" + trail + "' style='" + linkStyle + "'>";
      output += "Home";
    } else if (i == (parseEnd - 1)) {
      output += document.title;
      separator = "";
    } else {
      trail += leaves[i] + "/";
      output += "<a href='" + trail + "' style='" + linkStyle + "'>";
      output += trailMenu[leaves[i]];
    }
    output += "</a>" + separator;
  }
  output += "</span>";
  return output;
}
