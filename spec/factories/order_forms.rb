FactoryBot.define do
  factory :order_form do
    token                 {"user_token"}
    post_num              {"333-3333"}
    area_id               {2}
    municipal             {"Odaiba"}
    address               {222}
    build_name            {"集中の森"}
    phone_num             {"33333333333"}
  end
end
