<div class="light_box" id="alert_div" style="display: none; left: 50%; margin-left: -223px; z-index: 1002; position: absolute; top: 840px; margin-top: 0px;">
    <h3 id="see_id"></h3>
    <div id="sign_up_form">
        <div id="actions">
            <a class="form_button sprited" id="alert_yes" href="javascript:;" title="{LOGINBTN}"></a>
            <a class="close form_button sprited" id="alert_cancel" href="javascript:;" title="Cancel"></a>

        </div>
    </div>
    <a id="close_x" class="close sprited" href="#">close</a>
</div>

<script>
$(function () {
    $('#logout_btn').on("click", function(e){
        $('#alert_div').lightbox({
            centered: true,
            onLoad: function() {
                $('#alert_div h3').text("{LOGOUT}");
            }
        });
        e.preventDefault();
    });
    $('#alert_yes').click(function(e) {
        $.get("action.php?action=logout");

        window.location.reload();
    });
});
</script>