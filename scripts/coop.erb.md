---
title: <%= title %>
name: <%= name %>
website: <%= website %>
email: <%= email %>
twitter: <%= twitter %>
github: <%= github %>
telephone: <%= telephone %>
address: <%= address %>
latitude: <%= latitude %>
longitude: <%= longitude %>
clients:
<% clients.each do |client| %>
- <%= client %>
<% end %>
services:
<% services.each do |service| %>
- <%= service %>
<% end %>
technologies:
<% technologies.each do |technology| %>
- <%= technology %>
<% end %>
---

<%= body %>
