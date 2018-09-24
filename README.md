# SLSearchController
- Search from sample fruits list


# Search mehtod

- Put the code for search and change field as per your requirements.

```ruby
func filterContentForSearchText(_ searchText: String) {
filterdFruits = self.fruits.filter({( fruit : Fruit) -> Bool in
return fruit.name.lowercased().contains(searchText.lowercased())
})
tableView.reloadData()
}
```

Tanks
