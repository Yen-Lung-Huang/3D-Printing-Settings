# 3D Printing Slicer Settings  

## 安裝與設定指南  

1. **安裝 Orca Slicer 2.2.0**  
   - [下載連結](https://github.com/SoftFever/OrcaSlicer/releases/tag/v2.2.0-beta)  

2. **打開 Orca Slicer 的設定資料夾**  
   ![打開 Orca Slicer 設定資料夾](https://github.com/user-attachments/assets/a25e2c53-8bf1-439a-853a-231aa897e807)  
   
3. **複製設定檔案**  
   - 將 GitHub Repo 中 `3D-Printing-Slicer-Settings/3D_Printer/Atom_3_Lite/Orca_Slicer_Settings/backup_v2.2.0-beta_1` 路徑底下的 `filament`、`machine` 和 `process` 資料夾貼到 `<Orca Slicer 設定資料夾>\user\default` 資料夾中。  

4. **重啟 Orca Slicer**
   - 選擇列印機和列印參數設定  
     ![image](https://github.com/user-attachments/assets/a1c21eb1-129f-4833-80ee-2a17bfb285e4)

5. **匯入列印機平臺模型**
   - 匯入列印機平臺模型，選擇 GitHub Repo 中 `3D-Printing-Slicer-Settings\3D_Printer\Atom_3_Lite\[Bed_Shape_Model]` 路徑底下的 `Atom_3_lite_bed.stl` 模型做匯入。
     ![image](https://github.com/user-attachments/assets/d190617a-ebae-4a2e-962b-5b8442153fed)


6. **匯入零件並切片**  
   - 將零件匯入 Orca Slicer 然後進行切片。
     ![Orca Slicer 切片](https://github.com/user-attachments/assets/bcdeb459-aa02-4c4a-8978-dcd263a561c7)  


7. **儲存 G-code**  
   - 將切片產生的 G-code 存入隨身碟。
     ![image](https://github.com/user-attachments/assets/e3629ed0-8a4d-4d52-96f6-d0730fb6069b)  


8. **開始列印**  
   - 將隨身碟插入 3D 列印機，開始列印。[(Reference)](https://irp.cdn-website.com/fc22b9d3/files/uploaded/ZH-Atom%203%20User_s%20Manual%20Final%20%281%29.pdf)   

9. **檢查第一層**  
   - 注意列印的第一層是否附著良好，若沒有，請停止列印，進行機器的 [水平校正](https://www.atom3dp.com/instruction/start/usermanual/bedleveling/stl/atom-3-/-3-lite) 和調整 [Z-offset](https://www.atom3dp.com/instruction/start/usermanual/bedleveling/stl/z---offset-調整)，然後重新開始列印。  

10. **完成列印**
   - 若順利印完，將印好的零件取下並關閉機器電源。
     ![Done](https://github.com/user-attachments/assets/1c8423b1-beee-47c4-81e9-191a5e1a787a)  


