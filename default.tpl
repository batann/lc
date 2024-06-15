<!DOCTYPE html>
<html>
<head><meta name="viewport" content=width="device-witdh initial-scale=1.0">
<style>







    /* Revealing 3D Menu CSS */
body
{
	font-family: sans-serif;
	font-size: 100%;
	padding: 0;
	margin: 0;
	color: green;
	background-color: #101820;
	z-index:999;
}

header{
 	 position: fixed;
 	 top: 35px;
  	width:90%; 
	z-index:999;
  
}
/* main page */
article
{
	position: absolute;
	width: 90%;
	left:-100px ;
	top: 70px;
	right: 0;
	bottom: 0;
	padding: 30px 15%;
	background-color: #101820;
	color:green;
	overflow: auto;
	z-index: 0;
	-webkit-transform-origin: 0 50%;
	-moz-transform-origin: 0 50%;
	-ms-transform-origin: 0 50%;
	-o-transform-origin: 0 50%;
	transform-origin: 0 50%;
}


article:after
{
	position: absolute;
	content: ' ';
	left: 100%;
	top: 0;
	right: 0;
	bottom: 0;
/*	background-image: -webkit-linear-gradient(right, rgba(0,0,0,0.2) 0%, transparent 100%);
	background-image: -moz-linear-gradient(right, rgba(0,0,0,0.2) 0%, transparent 100%);
	background-image: -ms-linear-gradient(right, rgba(0,0,0,0.2) 0%, transparent 100%);
	background-image: -o-linear-gradient(right, rgba(0,0,0,0.2) 0%, transparent 100%);
	background-image: linear-gradient(right, rgba(0,0,0,0.2) 0%, transparent 100%);
	pointer-events: none;*/
}

/* navigation */
nav
{
	position: fixed;
	left: -16em;
	top: 0;
	bottom: 0;
	background-color: #bada55;
	border-right: 50px solid #bada55;
box-shadow: 4px 0 5px rgba(0,0,0,0.2);
	z-index: 1;
	cursor: pointer;
color:blue;
}

nav:after
{
	position: absolute;
	content: ' ';
	width: 0;
	height: 0;
	right: -70px;
	top: 50%;
	border-width: 15px 10px;
	border-style: solid;
	border-color: transparent transparent transparent #bada55;
}

nav ul
{
	width: 14em;
	list-style-type: none;
	margin: 0;
	padding: 1em;
}

nav a:link, nav a:visited
{
	display: block;
	width: 100%;
	font-weight: bold;
	line-height: 2.5em;
	text-indent: 10px;
	text-decoration: none;
	color: #fff;
	border-radius: 4px;
	outline: 0 none;
}

nav a:hover, nav a:focus
{
	color: #fff;
	background-color: darken(#bada55, 20%);
	text-shadow: 0 0 4px #fff;
	box-shadow: inset 0 2px 2px rgba(0,0,0,0.2);
}

/* hovering */
article, article:after, nav, nav *
{
	-webkit-transition: all 600ms ease;
	-moz-transition: all 600ms ease;
	-ms-transition: all 600ms ease;
	-o-transition: all 600ms ease;
	transition: all 600ms ease;
}

nav:hover
{
	left: 0;
}

nav:hover ~ article
{
	-webkit-transform: translateX(16em) perspective(600px) rotateY(10deg);
	-moz-transform: translateX(16em) perspective(600px) rotateY(10deg);
	-ms-transform: translateX(16em) perspective(600px) rotateY(10deg);
	-o-transform: translateX(16em) perspective(600px) rotateY(10deg);
	transform: translateX(16em) perspective(600px) rotateY(10deg);
}

nav:hover ~ article:after
{
	left: 60%;
}

/* typography */
footer
{
	margin-top: 2em;
	border-top: 1px dotted #999;
}

h1
{
	font-size: 2.5em;
	font-weight: normal;
	margin: 0 0 0.2em 0;
}

p
{
	line-height: 1.3em;
	margin: 0 0 1.5m 0;
}

.lead {
  font-weight:100;
  font-size:21px;
}

picture {
  width:100%;
  height:auto;
  display:block;
}
ody {
background-color:#d3d3d3;
color:rgb(105, 105, 0);
font-family:Arial, sans-serif;
font-size:0.9em;
}
.frame {
  width: 90%;
  margin: 40px auto;
  text-align: center;
}

button {
  margin: 20px;
}
.custom-btn {
  width: 130px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}

/* 1 */
.btn-1 {
  background: rgb(6,14,131);
  background: linear-gradient(0deg, rgba(6,14,131,1) 0%, rgba(12,25,180,1) 100%);
  border: none;
}

@-webkit-keyframes shiny-btn1 {
    0% { -webkit-transform: scale(0) rotate(45deg); opacity: 0; }
    80% { -webkit-transform: scale(0) rotate(45deg); opacity: 0.5; }
    81% { -webkit-transform: scale(4) rotate(45deg); opacity: 1; }
    100% { -webkit-transform: scale(50) rotate(45deg); opacity: 0; }
}

/* 20 */
.btn-20{
  position: relative;
  right: 20px;
  bottom: 20px;
  border:none;
  box-shadow: none;
  width: 130px;
  height: 40px;
  line-height: 42px;
  -webkit-perspective: 230px;
  perspective: 230px;
}
.btn-20 span {
  background: rgb(0,172,238);
background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(2,126,251,1) 100%);
  display: block;
  position: absolute;
  width: 130px;
  height: 40px;
  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  border-radius: 5px;
  margin:0;
  text-align: center;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all .3s;
  transition: all .3s;
}
.btn-20 span:nth-child(1) {
  box-shadow:
   -7px -7px 20px 0px #fff9,
   -4px -4px 5px 0px #fff9,
   7px 7px 20px 0px #0002,
   4px 4px 5px 0px #0001;
  -webkit-transform: rotateX(90deg);
  -moz-transform: rotateX(90deg);
  transform: rotateX(90deg);
  -webkit-transform-origin: 50% 50% -20px;
  -moz-transform-origin: 50% 50% -20px;
  transform-origin: 50% 50% -20px;
}
.btn-20 span:nth-child(2) {
  -webkit-transform: rotateX(0deg);
  -moz-transform: rotateX(0deg);
  transform: rotateX(0deg);
  -webkit-transform-origin: 50% 50% -20px;
  -moz-transform-origin: 50% 50% -20px;
  transform-origin: 50% 50% -20px;
}
.btn-20:hover span:nth-child(1) {
  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  -webkit-transform: rotateX(0deg);
  -moz-transform: rotateX(0deg);
  transform: rotateX(0deg);
}
.btn-20:hover span:nth-child(2) {
  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
 color: transparent;
  -webkit-transform: rotateX(-90deg);
  -moz-transform: rotateX(-90deg);
  transform: rotateX(-90deg);
}


/* 12 */
.btn-12{
  position: relative;
  right: 20px;
  bottom: 20px;
  border:none;
  box-shadow: none;
  width: 130px;
  height: 40px;
  line-height: 42px;
  -webkit-perspective: 230px;
  perspective: 230px;
}
.btn-12 span {
  background: rgb(0,172,238);
background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(2,126,251,1) 100%);
  display: block;
  position: absolute;
  width: 130px;
  height: 40px;
  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  border-radius: 5px;
  margin:0;
  text-align: center;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all .3s;
  transition: all .3s;
}
.btn-12 span:nth-child(1) {
  box-shadow:
   -7px -7px 20px 0px #fff9,
   -4px -4px 5px 0px #fff9,
   7px 7px 20px 0px #0002,
   4px 4px 5px 0px #0001;
  -webkit-transform: rotateX(90deg);
  -moz-transform: rotateX(90deg);
  transform: rotateX(90deg);
  -webkit-transform-origin: 50% 50% -20px;
  -moz-transform-origin: 50% 50% -20px;
  transform-origin: 50% 50% -20px;
}
.btn-12 span:nth-child(2) {
  -webkit-transform: rotateX(0deg);
  -moz-transform: rotateX(0deg);
  transform: rotateX(0deg);
  -webkit-transform-origin: 50% 50% -20px;
  -moz-transform-origin: 50% 50% -20px;
  transform-origin: 50% 50% -20px;
}
.btn-12:hover span:nth-child(1) {
  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  -webkit-transform: rotateX(0deg);
  -moz-transform: rotateX(0deg);
  transform: rotateX(0deg);
}
.btn-12:hover span:nth-child(2) {
  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
 color: transparent;
  -webkit-transform: rotateX(-90deg);
  -moz-transform: rotateX(-90deg);
  transform: rotateX(-90deg);
}

.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color:rgb(0, 60, 255):
  color: white;
  text-align: center;
}
</style>
</head>
<body style="background-color: #3a5ab1;">




<body>
 <!-- menu -->
    <nav style="color:orange;background-color:#190195;">
        <ul>
            <li><a href="https://www.chess.com/">Chess</a></li>
            <li><a href="https://www.chess.com/">Chess</a></li>
            <li><a href="https://www.chess.com/">Chess</a></li>
            <li><a href="https://www.chess.com/">Chess</a></li>
            <li><a href="https://www.chess.com/">Chess</a></li>
            <li><a href="https://www.chess.com/">Chess</a></li>
            <li><a href="https://www.chess.com/">Chess</a></li>
            <li><a href="http://www.amazon.com">HotForSecurity</a></li>
          <li><a href="http://www.pypi.org">Pypi</a></li>
          <li><a href="http://www.reddit.com">Reddit</a></li>
          <form method="get" id="searchbar" action="https://www.duckduckgo.com">
            <input class="searchbar" type="text" name="q" maxlenght="300" placeholder="Ducky Search"/>
            <input type="submit" value="Search" style="visibility: hidden;" /></form>
          <form method="get" id="searchbar" action="https://www.youtube.com/results/">
                <input class="searchbar" type="text" name="q" maxlenght="300" placeholder="Youtube Search"/>
                <input type="submit" value="Search" style="visibility: hidden;" /></form>
            <form method="get" id="searchbar" action="https://www.reddit.com/search/">
                    <input class="searchbar" type="text" name="q" maxlenght="300" placeholder="Reddit Search"/>
                        <input type="submit" value="Search" style="visibility: hidden;" /></form>
                </ul>
    </nav>

    <!-- main article -->
    <article>
     <Center>
      <header>
      <div id="main" style="background-color: #190195;">
        <button onclick="window.location.href='/home/batan/hom/todo/todo.html'" class="custom-btn btn-12"><span>Click!</span><span>ToDo</span></button>|
        <button onclick="window.location.href='%root_path%index.html'" class="custom-btn btn-12"><span>Click!</span><span>Index</span></button>|
        <button onclick="window.location.href='%root_path%diary/diary.html'" class="custom-btn btn-12"><span>Click!</span><span>Diary</span></button>|
        <button onclick="window.location.href='%root_path%index.html'" class="custom-btn btn-12"><span>Click!</span><span>Index</span></button>|
        <button onclick="window.location.href='%root_path%index.html'" class="custom-btn btn-12"><span>Click!</span><span>Index</span></button>|
        <button onclick="window.location.href='%root_path%index.html'" class="custom-btn btn-12"><span>Click!</span><span>Index</span></button>|
        <button onclick="window.location.topFunction()" class="custom-btn btn-20"><span>Back</span><span>Top</span></button>|
        </header>
        </Center>
        <div class="content">
    %content%
   </div>
</article>



<script>
// Get the button
let mybutton = document.getElementById("custom-btn btn-20");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>

</body>
</html>
