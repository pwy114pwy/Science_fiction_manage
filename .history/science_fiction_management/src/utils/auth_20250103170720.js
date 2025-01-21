// utils/auth.js
export function isLoggedIn() {
  // 检查是否有有效的 token
  const token = localStorage.getItem('token');
  return !!token; // 如果有 token 返回 true, 否则返回 false
}