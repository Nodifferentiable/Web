// 选中轮播图
let Lb = document.getElementById("lunbo");

let left = document.getElementById("left_a");
let right = document.getElementById("right_a");

let num = 1;

// 自动换图
setInterval(function (){
    num++;
    if (num === 5){
        num = 1;
        Lb.style.backgroundImage = 'url("./pic/p1.jpg")'
    }else if(num === 1){
        Lb.style.backgroundImage = 'url("./pic/p1.jpg")'
    }else if(num === 2){
        Lb.style.backgroundImage = 'url("./pic/p2.jpg")'
    }else if(num === 3){
        Lb.style.backgroundImage = 'url("./pic/p3.jpg")'
    }else if(num === 4){
        Lb.style.backgroundImage = 'url("./pic/p4.jpg")'
    }
},3000)




// 点击箭头实现图片的切换
left.onclick = function (){
    num--;
    if(num === 0){
        num = 4;
        Lb.style.backgroundImage = 'url("./pic/p4.jpg")'
    }else if(num === 1){
        Lb.style.backgroundImage = 'url("./pic/p1.jpg")'
    }else if(num === 2){
        Lb.style.backgroundImage = 'url("./pic/p2.jpg")'
    }else if(num === 3){
        Lb.style.backgroundImage = 'url("./pic/p3.jpg")'
    }else if(num === 4){
        Lb.style.backgroundImage = 'url("./pic/p4.jpg")'
    }
}
right.onclick = function (){
    num++;
    if (num === 5){
        num = 1;
        Lb.style.backgroundImage = 'url("./pic/p1.jpg")'
    }else if(num === 1){
        Lb.style.backgroundImage = 'url("./pic/p1.jpg")'
    }else if(num === 2){
        Lb.style.backgroundImage = 'url("./pic/p2.jpg")'
    }else if(num === 3){
        Lb.style.backgroundImage = 'url("./pic/p3.jpg")'
    }else if(num === 4){
        Lb.style.backgroundImage = 'url("./pic/p4.jpg")'
    }
}

// 点击小圆点实现图片切换
let all_li = document.getElementsByClassName("li2")

for (let i=0; i<all_li.length; i++){
    //给每一个li元素赋值，每循环一次，i+1；
    all_li[i].index = i;
    all_li[i].onclick = function (){
        // li的索引是从0开始的，所以要+1
        let num = this.index+1;
        if(num === 1){
            Lb.style.backgroundImage = 'url("./pic/p1.jpg")'
        }else if(num === 2){
            Lb.style.backgroundImage = 'url("./pic/p2.jpg")'
        }else if(num === 3){
            Lb.style.backgroundImage = 'url("./pic/p3.jpg")'
        }else if(num === 4){
            Lb.style.backgroundImage = 'url("./pic/p4.jpg")'
        }
    }
}


