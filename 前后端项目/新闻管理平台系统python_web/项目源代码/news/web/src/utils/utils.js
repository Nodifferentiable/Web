const tools = {

    getToken() {
        return localStorage.getItem("token")
    },
    getUserInfo() {
        return localStorage.getItem("userInfo")
    },
    getParseUserInfo() {
        return JSON.parse(localStorage.getItem("userInfo"))
    },
    getUserId() {
        return JSON.parse(localStorage.getItem("userInfo")).id
    },
    // 判断当前是否是超级管理员
    isSuperAdmin() {
        console.log(JSON.parse(localStorage.getItem("userInfo")).role_type)
        return JSON.parse(localStorage.getItem("userInfo")).role_type === "ROLE_ADMIN"
    }

}

export default tools
