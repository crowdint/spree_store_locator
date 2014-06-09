json.array! @stores do |store|
  json.id       store.id
  json.name     store.name
  json.lat      store.latitude
  json.lng      store.longitude
  json.address  store.address1
  json.address2 store.address2
  json.city     store.city
  json.state    store.state
  json.postal   store.zip
  json.web      store.website
end

