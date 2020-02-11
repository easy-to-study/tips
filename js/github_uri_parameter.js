$(function () {
    $('#submit').click(function (event) {
        console.log("クリックされましたよ");

        $('#body').select();
        document.execCommand('copy');

        var title = $('#id').val();
        // var body = $('#body').val();　// URLに渡せないためコピペすることにした
        var assignees = "sataga";
        var labels = "bug,hoge-Support,確認中/tier1";
        var projects = "easy-to-study/github_test/1"
        var url = "https://github.com/easy-to-study/github_test/issues/new?labels=" + labels + "&title=" + title + "&projects=" + projects + "&assignees=" + assignees;
        var encode_uri = encodeURI(url);
        console.log("before: " + url.length)
        console.log("after : " + encode_uri.length);
        window.open(encodeURI(url), '_blank');

    });

    // clipboard.jsの基本的な使い方
    new ClipboardJS('.btn', {
        container: document.getElementById('bar')
    });

    $(document).on("click", "#copy", function () {
        console.log("コピーしたよ");
        // コピー元を取得
        let copyTarget = $('#body').val();
        console.log(copyTarget);
        // コピー内容を一時的に格納するtextareaオブジェクトを作成する.
        let copyInput = $('<textarea></textarea>');
        // ★★CSSをうまく設定しないと見えてしまいます★★
        copyInput.css({ 'position': 'absolute', 'right': '0' });
        copyInput.val(copyTarget);

        // textareaオブジェクトをbodyの最後に追加する.
        $('body').append(copyInput);

        // textareaオブジェクトの内容を選択する.
        copyInput.focus();
        copyInput.select();

        // 選択したものをコピーする.
        document.execCommand('copy');

        // textareaオブジェクトを削除する.
        copyInput.remove();
    });
});




