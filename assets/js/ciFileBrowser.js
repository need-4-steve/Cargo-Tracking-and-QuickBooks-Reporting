ciFileBrowser = {};

ciFileBrowser.randomString = {
  inString:'abcdefghijklmnopqrstuvwxyz',
 // inString:'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',
 // inString:'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789',
  length:3,
  new: function(length){
    if(typeof length == 'undefined') length = ciFileBrowser.randomString.length;
    var text = '';
    var inStringLength = ciFileBrowser.randomString.inString.length;
    for( var i=0; i < length; i++ )
    {
      text += ciFileBrowser.randomString.inString.charAt(Math.floor(Math.random() * inStringLength));
    }
    return text;
  }
};

ciFileBrowser.id = {
  current: '',
  turn:0,
  new:function(){
    ciFileBrowser.id.turn++;
    var id = ciFileBrowser.randomString.new(2) + (new Date().getTime().toString(36)) + ciFileBrowser.id.turn.toString(36);
    if(id == ciFileBrowser.id.current){
      return ciFileBrowser.id.new();
    }
    else{ 
      ciFileBrowser.id.current = id;
      return id;
    }
  },
};


//find one parameter
ciFileBrowser.get = function(p,def)
{
  var result = null;
  if(typeof p == 'undefined' && typeof def != 'undefined' ) return def;
  if(typeof p == 'function')  return p();
  else return p;
};