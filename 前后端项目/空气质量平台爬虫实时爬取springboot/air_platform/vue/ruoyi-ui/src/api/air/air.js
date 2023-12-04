import request from '@/utils/request'

// 查询空气质量数据列表
export function listAir(query) {
  return request({
    url: '/air/air/list',
    method: 'get',
    params: query
  })
}

// 查询空气质量数据详细
export function getAir(id) {
  return request({
    url: '/air/air/' + id,
    method: 'get'
  })
}

// 新增空气质量数据
export function addAir(data) {
  return request({
    url: '/air/air',
    method: 'post',
    data: data
  })
}

// 修改空气质量数据
export function updateAir(data) {
  return request({
    url: '/air/air',
    method: 'put',
    data: data
  })
}

// 删除空气质量数据
export function delAir(id) {
  return request({
    url: '/air/air/' + id,
    method: 'delete'
  })
}

// 根据省名获取城市总体空气质量数据
export function getCityDataByProvinceName(provinceName) {
  return request({
    url: '/air/air/getCityDataByProvinceName/' + provinceName,
    method: 'get',
  })
}

export function getCityQualityByProvinceName(provinceName) {
  return request({
    url: '/air/air/getCityQualityByProvinceName/' + provinceName,
    method: 'get',
  })
}
export function getPointQualityByProvinceName(provinceName) {
  return request({
    url: '/air/air/getPointQualityByProvinceName/' + provinceName,
    method: 'get',
  })
}

// 获取城市最新空气质量数据
export function getNewestDataByProvinceName(provinceName) {
  return request({
    url: '/air/air/getNewestDataByProvinceName/' + provinceName,
    method: 'get',
    timeout: 3600000
  })
}
