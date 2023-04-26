let login_form = {
    init:function() {
        $("#login_btn").click( () => {
            login_form.send();
        });
    },
    send:function() {
        $("#login_form").attr({
            'action':'/loginimpl',
            'method':'post'

        });
        $("#login_form").submit();
    }
};


$(function() {
    login_form.init();
});


let rgs_form = {
    init:() => {
        $("#rgs_btn").click( () => {
            rgs_form.send();
        });
    },
    send:() => {
        $("#rgs_form").attr({
            'action':'/rgsimpl',
            'method':'get'
        });
        $("#rgs_form").submit();
    }
};

$( () => {
    rgs_form.init();
});


let jsp01 = {
    data:0,
    init:(num) => {
        this.data = num;
        // this.data = `<c:out value="${num}"/>`;
        jsp01.display();
    },
    display:() => {
        $('#jsp01').text(this.data + ``);
    }
};

$(() => {
    jsp01.init(num);
});