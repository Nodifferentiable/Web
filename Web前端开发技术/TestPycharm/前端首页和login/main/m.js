// 选中轮播图
var Lb = document.getElementById("lunbo")
var num = 1;

//自动换图
setInterval(function () {
    num = (num + 1) % 4;
    Lb.style.backgroundImage = 'url(pic/p' + num + ".jpg)"
    console.log('url(pic/p' + num + ".jpg)")
}, 5000)


var left = document.getElementById("left_a")
var right = document.getElementById("right_a")

// 点击左箭头换图
tranform = function () {
    num = (num + 1) % 4;
    Lb.style.backgroundImage = 'url(pic/p' + num + ".jpg)"
}
left.onclick = tranform
right.onclick = tranform

//点击圆点换图
var allli = document.getElementsByClassName('li2')

for (var i = 0; i < allli.length; i++) {
    // 给每一个li元素赋值,每循环一次, i+1;
    allli[i].index = i;
    allli[i].onclick = function () {
        // li的索引是从0开始的,所以要+1
        var num = this.index + 1;
        if (num === 1) {
            Lb.style.backgroundImage = 'url("pic/p1.jpg")'
        } else if (num === 2) {
            Lb.style.backgroundImage = 'url("pic/p2.jpg")'
        } else if (num === 3) {
            Lb.style.backgroundImage = 'url("pic/p3.jpg")'
        } else if (num === 4) {
            Lb.style.backgroundImage = 'url("pic/p4.jpg")'
        }
    }
}