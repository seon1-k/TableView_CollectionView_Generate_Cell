UITableView / UICollectionView 셀 간단하게 생성하기
====
커스텀 셀을 사용할 경우, 셀이 옵셔널이기 때문에 강제/비강제 해제를 해주어야 합니다.

그러다보면 코드가 아래와 같이 지저분해지죠..

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath) as? CustomCell else {
          let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
          return cell
      }
      return cell
}
```

그렇다고 강제로 해제하자니, 느낌표(!)가 너무 거슬리고..

하지만 아래처럼 깔끔하게 구현할 수 있어요!

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.generateCell(withIdentifier: "identifier", for: indexPath, cellClass: CustomCell.self)
      return cell
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.generateCell(withIdentifier: "identifier, for: indexPath, cellClass: CustomCell.self)
      return cell  
}
```
