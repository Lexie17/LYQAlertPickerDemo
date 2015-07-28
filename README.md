# LYQAlertPickerDemo
## 需求：在ActionSheet显示UIPickerView，点击其他区域收起

## iOS8以后，UIPickerView不能直接addSubview到UIActionSheet上，
## 并且Apple会逐渐抛弃UIActionSheet和UIAlertView,用UIAlertViewController代替

## 解决方案：在UIAlertViewController上add UIPickerView
