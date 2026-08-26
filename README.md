# Cloud Atlas · 云图 MVP

这是一个可直接部署到 GitHub Pages 的第一版原型。

## 已实现

- 首页只有世界地图，不用 emoji 代替地图上的云
- 手机 Safari 可调用相机选择/拍摄云照片
- 浏览器定位权限
- 用用户真实照片作为云贴图
- 使用 Three.js 将照片作为贴图做成可旋转的简易 3D 云模型
- 完整照片和模型参数优先保存到浏览器 IndexedDB，本地优先
- 云的现实尺寸采用“原型估算”，不是气象学实测
- 模型最大尺寸 = min(估算尺寸 × 1.2, 2 km)
- 3D 编辑器可以调整模型大小和高度
- 地图上显示实际照片贴图，不使用云 emoji
- 预留以后接入共享数据库的位置

## 重要限制

当前 GitHub Pages 版本是“本地优先 Demo”。

也就是说：
- 你手机上创建的云会保存在这个浏览器的 IndexedDB
- 换另一台手机/浏览器暂时看不到同一朵云
- GitHub Pages 本身不能当全球云数据库
- 要实现“全世界用户看到同一张云地图”，下一步需要接入 Supabase 等后端

## 部署到 GitHub Pages

1. 在 GitHub 新建一个仓库，例如 `cloud-atlas`
2. 把 `index.html` 上传到仓库根目录
3. 打开仓库的 Settings
4. 找到 Pages
5. Source 选择 `Deploy from a branch`
6. Branch 选择 `main` 和 `/ (root)`
7. 保存
8. 等待 GitHub Pages 完成部署
9. 打开生成的 Pages 地址

## 手机 Safari 注意

定位和相机通常要求 HTTPS。GitHub Pages 默认是 HTTPS，因此比直接打开本地 HTML 更适合测试。

第一次点击“获取当前位置”时，Safari 会询问位置权限，请选择允许。

## 下一阶段

真正的共享版应该增加：

- Supabase Auth
- Supabase PostgreSQL
- Supabase Storage
- PostGIS 地理空间查询
- 云冲突检测
- “请求缩小对方云体积”
- “请求提升对方云高度”
- 协商状态
- 云端缩略贴图
- 用户主动备份完整 `.glb`
- 自动清理长期未备份的云端大文件

另外，当前 3D 云是“贴图分层体积”的原型，不是真正的 AI 体积重建。后续可以把这一层替换成真正的云 3D 重建服务。
