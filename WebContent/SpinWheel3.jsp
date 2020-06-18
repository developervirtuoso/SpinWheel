<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style type="text/css">
    text{
        font-family:Helvetica, Arial, sans-serif;
        font-size:11px;
        pointer-events:none;
    }
    #chart{
        position:absolute;
        width:500px;
        height:500px;
        top:0;
        left:10%;
    }
    #question{
        position: absolute;
        width:400px;
        height:500px;
        top:0;
        left:520px;
    }
    #question h1{
        font-size: 50px;
        font-weight: bold;
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        position: absolute;
        padding: 0;
        margin: 0;
        top:50%;
        -webkit-transform:translate(0,-50%);
                transform:translate(0,-50%);
    }
    .modal-body {
	    position: relative;
	    padding: 0px;
	    text-align: center;
	}
    </style>
    
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-12" id="formid">
				<form action="#">
					<div class="form-group">
				      <label for="name">Name:</label>
				      <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name">
				    </div>
				    <div class="form-group">
				      <label for="email">Email:</label>
				      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
				    </div>
				    <div class="form-group">
				      <label for="phone">Phone Number:</label>
				      <input type="number" class="form-control" id="phone" placeholder="Enter Phone Number" name="phone">
				    </div>
				    <div class="form-group">
				      <label for="name">Win Price:</label>
				      <input type="text" class="form-control" id="win"  name="win" readonly="readonly" value="0">
				    </div>
				    <button type="button" class="btn btn-primary" id="playgame" onclick="playgamefnc();" data-toggle="modal" data-target="#myModal">Play Game</button>
				   <button type="submit" class="btn btn-primary" id="submit"  >Submit</button>
				</form>
			</div>
		</div>
		
		<div class="modal fade" id="myModal" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		      
		       <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title" style="text-align: center;">Play & Win Coin</h4>
		      </div>
		        <div class="modal-body">
		          <div id="chart"></div>
				  <div id="question"><h1></h1></div>
		        </div>
		       
		      </div>
		      
		    </div>
 	 	</div>
		
		
	</div>
   
   <script type="text/javascript">
   
   </script>
    <script src="https://d3js.org/d3.v3.min.js" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
    var spinid=document.getElementById("spinid");
        var padding = {top:20, right:40, bottom:0, left:0},
            w = 500 - padding.left - padding.right,
            h = 500 - padding.top  - padding.bottom,
            r = Math.min(w, h)/2,
            rotation = 0,
            oldrotation = 0,
            picked = 100000,
            oldpick = [],
            color = d3.scale.category20();//category20c()
            //randomNumbers = getRandomNumbers();

        //http://osric.com/bingo-card-generator/?title=HTML+and+CSS+BINGO!&words=padding%2Cfont-family%2Ccolor%2Cfont-weight%2Cfont-size%2Cbackground-color%2Cnesting%2Cbottom%2Csans-serif%2Cperiod%2Cpound+sign%2C%EF%B9%A4body%EF%B9%A5%2C%EF%B9%A4ul%EF%B9%A5%2C%EF%B9%A4h1%EF%B9%A5%2Cmargin%2C%3C++%3E%2C{+}%2C%EF%B9%A4p%EF%B9%A5%2C%EF%B9%A4!DOCTYPE+html%EF%B9%A5%2C%EF%B9%A4head%EF%B9%A5%2Ccolon%2C%EF%B9%A4style%EF%B9%A5%2C.html%2CHTML%2CCSS%2CJavaScript%2Cborder&freespace=true&freespaceValue=Web+Design+Master&freespaceRandom=false&width=5&height=5&number=35#results

        var data = [
                    {"label":"10",  "value":1,  "question":"10"}, // padding
                    {"label":"50",  "value":1,  "question":"50"}, //font-family
                    {"label":"80",  "value":1,  "question":"80"}, //color
                    {"label":"120",  "value":1,  "question":"120"}, //font-weight
                    {"label":"200",  "value":1,  "question":"200"}, //font-size
                    {"label":"150",  "value":1,  "question":"150"}, //background-color
                    {"label":"220",  "value":1,  "question":"220"}, //nesting
                    {"label":"320",  "value":1,  "question":"320"}, //bottom
                    {"label":"500",  "value":1,  "question":"500"}, //sans-serif
                    {"label":"550", "value":1, "question":"550"}, //period
                    {"label":"410", "value":1, "question":"410"}, //pound sign
                    {"label":"450", "value":1, "question":"450"}, //<body>
                    {"label":"1000", "value":1, "question":"1000"}, //<ul>
                    {"label":"2000", "value":1, "question":"2000"}, //<h1>
                    {"label":"5000", "value":1, "question":"5000"} //margin
        ];


        var svg = d3.select('#chart')
            .append("svg")
            .data([data])
            .attr("width",  w + padding.left + padding.right)
            .attr("height", h + padding.top + padding.bottom);

        var container = svg.append("g")
            .attr("class", "chartholder")
            .attr("transform", "translate(" + (w/2 + padding.left) + "," + (h/2 + padding.top) + ")");

        var vis = container
            .append("g");
            
        var pie = d3.layout.pie().sort(null).value(function(d){return 1;});

        // declare an arc generator function
        var arc = d3.svg.arc().outerRadius(r);

        // select paths, use arc generator to draw
        var arcs = vis.selectAll("g.slice")
            .data(pie)
            .enter()
            .append("g")
            .attr("class", "slice");
            

        arcs.append("path")
            .attr("fill", function(d, i){ return color(i); })
            .attr("d", function (d) { return arc(d); });

        // add the text
        arcs.append("text").attr("transform", function(d){
                d.innerRadius = 0;
                d.outerRadius = r;
                d.angle = (d.startAngle + d.endAngle)/2;
                return "rotate(" + (d.angle * 180 / Math.PI - 90) + ")translate(" + (d.outerRadius -10) +")";
            })
            .attr("text-anchor", "end")
            .text( function(d, i) {
                return data[i].label;
            });

        container.on("click", spin);
       

        function spin(d){
            //alert("jhgjh");
            container.on("click", null);

            //all slices have been seen, all done
            console.log("OldPick: " + oldpick.length, "Data length: " + data.length);
            if(oldpick.length == data.length){
                console.log("done");
                container.on("click", null);
                return;
            }

            var  ps       = 360/data.length,
                 pieslice = Math.round(41440/data.length),
                 rng      = Math.floor((Math.random() * 41440) + 360);
                
            rotation = (Math.round(rng / ps) * ps);
            
            picked = Math.round(data.length - (rotation % 360)/ps);
            picked = picked >= data.length ? (picked % data.length) : picked;


            if(oldpick.indexOf(picked) !== -1){
              //  d3.select(this).call(spin);
               // return;
            } else {
                oldpick.push(picked);
            }

            rotation += 90 - Math.round(ps/2);

            vis.transition()
                .duration(5000)
                .attrTween("transform", rotTween)
                .each("end", function(){

                    //mark question as seen
                    //d3.select(".slice:nth-child(" + (picked + 1) + ") path").attr("fill", "red");

                    //populate question
                   // d3.select("#question h1").text(data[picked].question);
					//alert(data[picked].question);
					//document.getElementById("submit").style.display="block";
					document.getElementById("playgame").style.display="none";
					document.getElementById("win").value=data[picked].question;
                    oldrotation = rotation;
                    $('#myModal').modal('hide');
                    container.on("click", spin);
                });
        }

        //make arrow
        svg.append("g")
            .attr("transform", "translate(" + (w + padding.left + padding.right) + "," + ((h/2)+padding.top) + ")")
            .append("path")
            .attr("d", "M-" + (r*.15) + ",0L0," + (r*.05) + "L0,-" + (r*.05) + "Z")
            .style({"fill":"black"});

        //draw spin circle
        container.append("circle")
            .attr("cx", 0)
            .attr("cy", 0)
            .attr("r", 60)
            .style({"fill":"white","cursor":"pointer"});

        //spin text
        container.append("text")
            .attr("x", 0)
            .attr("y", 15)
            .attr("text-anchor", "middle")
            .text("SPIN")
            .style({"font-weight":"bold", "font-size":"30px"});
        
        
        function rotTween(to) {
          var i = d3.interpolate(oldrotation % 360, rotation);
          return function(t) {
            return "rotate(" + i(t) + ")";
          };
        }
        
        
        function getRandomNumbers(){
            var array = new Uint16Array(1000);
            var scale = d3.scale.linear().range([360, 1440]).domain([0, 100000]);

            if(window.hasOwnProperty("crypto") && typeof window.crypto.getRandomValues === "function"){
                window.crypto.getRandomValues(array);
                console.log("works");
            } else {
                //no support for crypto, get crappy random numbers
                for(var i=0; i < 1000; i++){
                    array[i] = Math.floor(Math.random() * 100000) + 1;
                }
            }

            return array;
        }

    </script>
</body>
</html>