<div id="featured">
	<h2>{search_title}</h2>
	<div>
		<h3 style="font-size: 25px;color:#ff7921;">{search_price}
			<label style="font-weight:normal;margin-left:20px;font-size: 16px;color:#555555;">單價：{search_unit}</label>
			<label style="font-weight:normal;margin-left:20px;font-size: 16px;color:#555555;">瀏覽人數：{search_view}</label>
            <label style="font-weight:normal;margin-left:20px;font-size: 16px;color:#555555;">加入最愛 <a href="javascript:;" id="add_favorite"><img src="img/favorite_gray.jpg" alt="加入最愛" width="20" height="20" style="cursor: pointer;" /></label>
		</h3>
		<a href="javascript:;"><img src="{search_img1}" alt="{search_title}" width="600" /></a>
		<ul>
			<li><a href="javascript:;"><img src="{search_img2}" alt="{search_title}" width="270" height="230" /></a></li>
			<li><a href="javascript:;"><img src="{search_img3}" alt="{search_title}" width="270" height="230" /></a></li>
		</ul>
		<div id="right">
			<ul>
				<li>
                    <p>
    					<label>類型：{search_type}</label>
                        <label>房數：{search_room}</label>
                        <label>坪數：{search_ping}</label>
                    </p>
				</li>
                <li>
                    <p>
                        <label>屋齡：{search_age}</label>
                        <label>樓層：{search_floor}</label>
                        <label>建商/建案名稱：{search_builder}</label>
                    </p>
                </li>
                <li>
                    <p>
                        <label>車位：{search_parking}</label>
                        <label>面向：{search_direction}</label>
                        <label>管理費：{search_fee}</label>
                    </p>
                </li>
				<li>
					<p>區域：{search_area} | {search_road} &nbsp;<label style="font-weight:normal;margin-left:20px;font-size: 16px;color:#555555;"><a href="javascript:;" id="add_map" style="cursor: pointer;">[查看地圖]</a></label></p>
				</li>
				<li>
					<p>生活機能：{search_arount}</p>
				</li>
				<li>
					{search_desc}
				</li>
				<li>
					<!-- START BLOCK : view_img -->
					<a href="javascript:;"><img src="{search_img}" alt="{search_title}" width="270" height="230" /></a>
					<!-- END BLOCK : view_img -->
				</li>
			</ul>
		</div>

	</div>
</div>
<script>
    // 加入最愛
    $("#add_favorite").click(function(){
        $.ajax({
            url: 'action.php?action=add_favorite',
            type: 'POST',
            dataType: 'text',
            async:false,
            data: {
                main_id: "{main_id}"
            }
        })
        .done(function(like) {
            if(like == '1'){
                $("#featured").find("#add_favorite").children('img').attr("src","img/favorite_red.jpg");
            }else{
                $("#featured").find("#add_favorite").children('img').attr("src","img/favorite_gray.jpg");
            }
        })
        .fail(function() {
            console.log("error");
        });
    });
    // 點擊地圖
    $("#add_map").click(function(){
        $.ajax({
            url: 'action.php?action=add_map',
            type: 'POST',
            dataType: 'text',
            async:false,
            data: {
                main_id: "{main_id}"
            }
        })
        .done(function(like) {
        })
        .fail(function() {
            console.log("error");
        });
    });

    // 停留時間
    show_time = 0;
    showTime();

    function showTime(){
        show_time =  show_time+1;
        setTimeout("showTime()",1000);
    }

    var userAgent = navigator.userAgent; // userAgent
    var isOpera = userAgent.indexOf("Opera") > -1; // Opera
    var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera; // IE
    var isIE11 = userAgent.indexOf("rv:11.0") > -1; // IE11
    var isEdge = userAgent.indexOf("Edge") > -1 && !isIE; // IE的Edge

    if(!isIE && !isEdge && !isIE11) {
        var is_fireFox = navigator.userAgent.indexOf("Firefox")>-1;

        if(is_fireFox){
            window.onbeforeunload = function (){
                if(is_fireFox){
                }
            };
        }else{
            window.onunload = function(){
                $.ajax({
                    url: 'action.php?action=stay_time',
                    type: 'POST',
                    dataType: 'text',
                    data: {
                        main_id: "{main_id}",
                        stay_time: show_time
                    }
                })
                .done(function(data) {
                })
                .fail(function() {
                    console.log("error");
                });
            };
        }
    }else if(isIE) {
        window.onbeforeunload = function() {
        }
        window.onunload = onclose;
        function onclose(){
        }
    }
</script>