$(document).ready(function() {
    $(".playlink").bind("click", function(e) {
        var playlink = $(this);
        var player = playlink.append("<audio>"); //new Audio("");
        playlink.text("LOADING");

        e.preventDefault();
        player.setAttribute("src", playlink.attr("data-href"));
        player.play();
        player.addEventListener("progress", function() {
            playlink.text("PAUSE");
            playlink.unbind("click");
            playlink.bind("click", function(e) {
                e.preventDefault();
                player.pause();
                playlink.text("PAUSED");
            });
        });
    });
});
