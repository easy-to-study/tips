$(function () {
    $('#submit').click(function (event) {
        console.log("クリックされましたよ");

        $('#body').select();
        document.execCommand('copy');

        var title = $('#id').val();
        var body = $('#body').val();
        var assignees = "sataga";
        var labels = "bug,hoge-Support,確認中/tier1";
        var projects = "easy-to-study/github_test/1"
        var url = "https://github.com/easy-to-study/github_test/issues/new?labels=" + labels + "&title=" + title + "&projects=" + projects + "&assignees=" + assignees;
        var encode_uri = encodeURI(url);
        console.log("before: " + url.length)
        console.log("after : " + encode_uri.length);
        window.open(encodeURI(url), '_blank');

    });

    new ClipboardJS('.btn', {
        container: document.getElementById('bar')
    });

});
