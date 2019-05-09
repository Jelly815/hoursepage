<div class="header">
    <ul id="navigation">
        <li>
            <a href="index.php" id="home" title="Home">Home</a>
        </li>
        <li>
            <a href="mailto:{ADMINMAIL}" id="email" title="Email">Email</a>
        </li>
    </ul>
    <div id="log_in_text">{USER_NAME}</div>
    <a href="index.php" id="logo" title="{HEADERTITLE}">
        <h1>{HEADERTITLE}</h1>
        <div>{HEADERTITLEDTAIL}</div>
    </a>
    <ul class="navigation">
        <li {SELECTED_DEFAULT}>
            <a href="index.php" title="{HOMEPAGE}">{HOMEPAGE}</a>
        </li>
        <li>
            <a id="navi_search" href="javascript:;" title="{ADSEARCH}">{ADSEARCH}</a>
        </li>
        <li {SELECTED_SIGNUP} id="login_li">
            {LOGIN_URL}
        </li>
    </ul>
    <div id="search_div">
        <input id="search_key" name="key" type="text" value="" placeholder="{ALERTXT11}">
        <a class="search_key_button sprited" id="key_button" href="javascript:;" title=""></a>
        <!--
        <form class="attireCodeToggleBlock" action="" style="display: none">
            <input
                    type="text"
                    multiple = "multiple"
                    class="multipleInputDynamicWithInitialValue"
                    name="search_key"
                    data-url="json/data.json"
                    placeholder="{ALERTXT10}"
                    id="area"
            />

            <button class="submitBtn" type="submit">Submit</button>
        </form>-->
    </div>
    <!-- START BLOCK : index_header -->
    <div id="featured">
        <div class="first">
            <ul>
                <li class="selected first">
                    <a id="first_a" href="featured.html">Search</a>

                    <div id="first_content">
                        <div class="mb20 filter-location-wrap">
                            <div class="filter-shadow" style="display: none;"></div>
                            <div class="filter-row">
                                <div class="clearfix">
                                    <div class="filter-name pull-left" style="padding-top: 6px;">區域</div>
                                    <div class="filter-body clearfix relative">
                                        <div class="filter-location">
                                            <div class="clearfix">
                                                <div title="高雄市" class="filter-region filter-location-btn pull-left  z-active">
                                                    <div class="u-arrow"></div>
                                                    <div class="j-region filter-location-btn-txt">高雄市</div>
                                                </div>
                                                <div title="" class="filter-section filter-location-btn pull-left">
                                                    <div class="u-arrow"></div>
                                                    <div class="filter-location-btn-txt">選擇鄉鎮</div>
                                                </div>
                                            </div>
                                            <div class="filter-location-list" style="display:none;">
                                                <div class="section-list clearfix">
                                                    <div class="section-list-unlimited pull-left">不限</div>
                                                    <div class="section-list-options clearfix">
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">三民區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">鳳山區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">左營區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">鼓山區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">苓雅區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">楠梓區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">前鎮區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">仁武區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">大寮區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">小港區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">鳥松區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">新興區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">前金區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">岡山區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">大社區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">橋頭區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">大樹區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">鹽埕區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">美濃區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">林園區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">燕巢區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">湖內區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">旗山區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">路竹區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">梓官區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">茄萣區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">六龜區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">杉林區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">阿蓮區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">甲仙區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">旗津區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">彌陀區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">田寮區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">內門區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">永安區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">桃源區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">那瑪夏區</a></div>
                                                        <div class="section-list-item"><a href="javascript:;" j-tips-txt="您最多可選擇5個鄉鎮" class="section-list-item-link">茂林區</a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="filter-saleprice-wrap">
                            <div class="filter-row clearfix">
                                <div class="filter-name">金額</div>
                                <div class="filter-body clearfix relative">
                                    <div class="filter-saleprice-options clearfix oh">
                                        <div class="filter-items z-small"><a href="javascript:;" data-gtm-stat="不限" class="">不限</a></div>
                                        <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="300萬以下" class="">300萬以下</a></div>
                                        <div class="filter-items z-multiple" style="margin-left:-30px;"><a href="javascript:;" data-gtm-stat="300-600萬以下" class="">300-600萬以下</a></div>
                                        <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="600-1000萬以下" class="">600-1000萬以下</a></div>
                                        <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="1000-1500萬以下" class="">1000-1500萬以下</a></div>
                                        <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="1500-2000萬以下" class="">1500-2000萬以下</a></div>
                                        <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="2000萬以上" class="">2000萬以上</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mb20 filter-shape-wrap">
                            <div class="filter-row clearfix">
                                <div class="filter-name pull-left">類型</div>
                                <div class="filter-body clearfix">
                                    <div class="filter-items z-small"><a href="javascript:;" data-gtm-stat="不限" class="">不限</a></div>
                                    <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="公寓" class="">公寓</a></div>
                                    <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="電梯大樓" class="">電梯大樓</a></div>
                                    <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="透天厝" class="">透天厝</a></div>
                                    <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="別墅" class="">別墅</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="mb20 filter-pattern-wrap">
                            <div class="filter-row clearfix">
                                <div class="filter-name">房數</div>
                                <div class="filter-body clearfix oh">
                                    <div class="filter-items z-small"><a href="javascript:;" data-gtm-stat="不限" class="">不限</a></div>
                                    <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="1房" class="">1房</a></div>
                                    <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="2房" class="">2房</a></div>
                                    <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="3房" class="">3房</a></div>
                                    <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="4房" class="">4房</a></div>
                                    <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="5房及以上" class="">5房及以上</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="filter-area-wrap">
                            <div class="filter-row clearfix">
                                <div class="filter-name">
                                    <div class="area-switch">
                                        <div title="坪數" class="area-switch-cur">坪數
                                            <i class="area-switch-icon fa fa-angle-down"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="filter-body clearfix">
                                    <div class="filter-area-options clearfix oh">
                                        <div class="filter-items z-small"><a href="javascript:;" data-gtm-stat="不限" class="">不限</a></div>
                                        <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="20坪以下" class="">20坪以下</a></div>
                                        <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="20-30坪以下" class="">20-30坪以下</a></div>
                                        <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="30-40坪以下" class="">30-40坪以下</a></div>
                                        <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="40-50坪以下" class="">40-50坪以下</a></div>
                                        <div class="filter-items z-multiple"><a href="javascript:;" data-gtm-stat="50坪以上" class="">50坪及以上</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- END BLOCK : index_header -->
</div>
<script>
$(function () {
    //var $select = $('select');

    // Run, fire and forget
    //$select.fastselect()

    // Run via plugin facade and get instance
    //var fastSelectInstance = $select.fastselect(options).data('fastselect');

    // run directly
    //var fastSelectInstance = new $.Fastselect($select.get(0), options);
    // 關鍵字搜尋
    $('#search_key').tagsInput({placeholder:'{ALERTXT11}'});
    // 縣市
    //$('.singleSelect').fastselect();
    //$('.multipleInputDynamicWithInitialValue').fastselect();
    $('#search_city').change(function(event) {
        if($(this).select().val() != ''){
            $('.attireCodeToggleBlock').show();
            //$('.fstMultipleMode .fstResultItem').remove();
//console.log('start');
            $.ajax({
                url: 'action.php',
                type: 'GET',
                dataType: 'json',
                async: false,
                data: {
                    action: 'getarea',
                    city_id: $(this).select().val()},
            })
            .done(function(re_data) {
                var new_option = '';

                $.each(re_data, function(i, val) {
                     new_option += '<span id="'+re_data[i].value+'" class="fstResultItem">'+re_data[i].text+'</span>';
                });

                $('.attireCodeToggleBlock .fstResults').remove('span').html(new_option);

                $('.multipleInputDynamicWithInitialValue').fastselect();
                $('.multipleInputDynamicWithInitialValue').data('data-url', 'json/data.json');
            })
            .fail(function() {
                console.log("error");
            });
            /*
            $.get('action.php',
                {
                    action: 'getarea',
                    city_id: $(this).select().val()
                },
                function(re_data){
                    var restaurant = $('.multipleInputDynamicWithInitialValue');

                    var owner = restaurant.data("data-url");
                    restaurant.data("data-url", JSON.parse("json/data.json"));
                    //console.log(re_data);
                    //$('.multipleInputDynamicWithInitialValue').data(re_data);

                    //var a = $('.multipleInputDynamicWithInitialValue').data('data-url'); //getter

                    //$('.multipleInputDynamicWithInitialValue').data('data-url',"json/data.json"); //setter
                }
            );*/
        }else{
            $('.attireCodeToggleBlock').hide();
        }
    });
    $('#navi_search').click(function(event) {
        $('.navigation li').removeClass('selected first');
        $(this).parent('li').addClass('selected first');
        $('#search_div').show().css('display',"inline-block" );
    });

    $('.filter-section').click(function(event) {
        $('.filter-location').addClass('z-open');
        $('.filter-location-list').show();
    });

});
</script>