var delta=0.015;
var collection;
var closeB=false;
function floaters() {
 this.items = [];
 this.addItem = function(id,x,y,content)
   {
   document.write('<DIV id='+id+' style="Z-INDEX: 10; POSITION: absolute; left:'+(typeof(x)=='string'?eval(x):x)+';top:'+(typeof(y)=='string'?eval(y):y)+'">'+content+'</DIV>');
   
   var newItem  = {};
   newItem.object  = document.getElementById(id);
   newItem.x  = x;
   newItem.y  = y;

   this.items[this.items.length] = newItem;
   }
 this.play = function()
   {
   collection  = this.items
   setInterval('play()',30);
   }
 }
 function play()
 {
  if(screen.width<=800 || closeB)
  {
  for(var i=0;i<collection.length;i++)
  {
   collection[i].object.style.display = 'none';
  }
  return;
  }
  for(var i=0;i<collection.length;i++)
  {
  var followObj = collection[i].object;
  var followObj_x = (typeof(collection[i].x)=='string'?eval(collection[i].x):collection[i].x);
  var followObj_y = (typeof(collection[i].y)=='string'?eval(collection[i].y):collection[i].y);

  if(followObj.offsetLeft!=(document.body.scrollLeft+followObj_x)) {
   var dx=(document.body.scrollLeft+followObj_x-followObj.offsetLeft)*delta;
   dx=(dx>0?1:-1)*Math.ceil(Math.abs(dx));
   followObj.style.left=followObj.offsetLeft+dx;
   }

  if(followObj.offsetTop!=(document.body.scrollTop+followObj_y)) {
   var dy=(document.body.scrollTop+followObj_y-followObj.offsetTop)*delta;
   dy=(dy>0?1:-1)*Math.ceil(Math.abs(dy));
   followObj.style.top=followObj.offsetTop+dy;
   }
  followObj.style.display = '';
  }
 } 
 function closeBanner()
 {
  closeB=true;
  return;
 }

var theFloaters = new floaters();
//修改路径及URL
theFloaters.addItem('followDiv1','document.body.clientWidth-125',100,'<br><img src="/CDUG/image/link-a-1.jpg" onclick=javascript:window.open("#") style=CURSOR:pointer><br><span onClick="closeBanner();" style="CURSOR:pointer;" class=title2>关闭</span>'); 
theFloaters.addItem('followDiv2',0,100,'<br><img src="/CDUG/image/link-a-1.jpg" onclick=javascript:window.open("#") style=CURSOR:pointer><br><span onClick="closeBanner();" style="CURSOR:pointer;" class=title2>关闭</span>');
theFloaters.play();
