$(function () {
    $('#submit').click(function (event) {
        console.log("クリックされましたよ");
        var title = $('#id').val();
        var body = $('#body').val();
        var labels = "bug,hoge-Support,確認中/tier1";
        console.log(body);
        var url = "https://github.com/easy-to-study/github_test/issues/new?labels="+ labels +"&title=" + title + "&body=" + body;
        // $url = $(this).attr('href');
        window.open(encodeURI(url), '_blank');

    });
});


