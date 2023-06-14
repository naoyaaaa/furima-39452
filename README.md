# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users

|Column|Type|Options|
|id|integer|null: false、primary key|
|nickname|string|null: false|
|mail_address|string|null: false、must contain @、unique: true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_pron|string|null: false|
|first_name_pron|string|null: false|
|birthdate|date|null: false|

## items

|id|integer|null: false|
|item_image|image|null: false|
|item_name|string|null: false|
|item_detail|string|null: false|
|category|array|null: false|
|condition|array|null: false|
|cost|array|null:false|
|region|array|null:false|
|howmanydays|array|null:false|
|price|integer|null:false|
|user_id|integer|foreign_key: true|


## purchase_logs


|log_id|integer|null:false|
|item_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|


## shipping_addresses

|postal_code|integer|null:false|
|prefecture|array|null:false|
|city|string|null:false|
|house_number|string|null:false|
|building_number|string|-|
|phone_number|integer|null:false|
|item_id|integer|foreign_key: true|
|log_id|integer|foreign_key: true|



### Association
class User 
  has_many :items
  has_many :purchase_logs
end

class Item
  belongs_to :user
  has_one : purchase_logs
  has_one : shipping_addresses
end

class Purchase_log
  belongs_to :users
  belongs_to :items
  has_one:shipping_addresses
end

class shippng_addresses
  belongs_to :items
  belongs_to :purchase_logs
end