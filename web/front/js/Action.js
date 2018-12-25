// JavaScript Document
/*nav导航*/
   $(".nav li").mouseover(function(){
	   $(this).find(".sub-nav").show()   
	   
	})
	
	 $(".nav li").mouseout(function(){
	   $(this).find(".sub-nav").hide()   
	   
	})

/*登录注册*/
$(".mask").click(function(){
	$(".mask,.login").hide();	
     })
	$(".login-click").click(function () {
        $(".mask").css({
            display: "block", height: $(document).height()
        });
		 var $box = $('.login');
        $box.css({
           display: "block"
        });
		$(".close").click(function () {
        $(".mask,.login").css("display", "none");
       });

    });

$(".mask").click(function(){
	$(".mask,.reg").hide();	
     })
	$(".reg-click").click(function () {
        $(".mask").css({
            display: "block", height: $(document).height()
        });
		 var $box = $('.reg');
        $box.css({
           display: "block"
        });
		$(".close").click(function () {
        $(".mask,.reg").css("display", "none");
       });


    });

$(".mask").click(function(){
	$(".mask,.reg").hide();	
     })
	$(".reg-href").click(function () {
        $(".mask").css({
            display: "block", height: $(document).height()
        });
		 var $t = $('.login');
        $t.css({
           display: "none"
        });
		 var $box = $('.reg');
        $box.css({
           display: "block"
        });
		
		$(".close").click(function () {
        $(".mask,.reg").css("display", "none");
       });
    });
		
  $(".hgt").click(function(){
	  $(this).find(".hgt-top").show()  
  })

  $(".tbt").click(function(){
	  $(this).find(".hgt-btm").slideToggle();  
  }) 

