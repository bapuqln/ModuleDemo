import axios from 'axios'

/*设置默认请求路径*/
axios.defaults.baseURL = 'http://localhost:3456'


/* 设置响应拦截器,可以处理响应数据 */
axios.interceptors.response.use((res)=>{
  return res.data
});

/* 获取sliders 数据 */

export const getSliders = ()=>{
  return axios.get('/sliders')
};

/* 获取热门图书*/
export const getHotBook = ()=>{
  return axios.get('/hot')
}
