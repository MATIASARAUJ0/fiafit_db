// BD_Gimnasio

Table t_users {
  user_id integer [pk, increment]
  user varchar
  password varchar
  created_at timestamptz
  updated_at timestamptz
}

Table t_roles {
  role_id integer [pk, increment]
  name varchar
  description text
  created_at timestamptz
  updated_at timestamptz
}

Table t_genders {
  gender_id integer [pk, increment]
  gender varchar
  created_at timestamptz
  updated_at timestamptz
}

Table t_document_types {
  document_type_id integer [pk, increment]
  document_name varchar
  acronyms varchar
  description text
  created_at timestamptz
  updated_at timestamptz
}

Table t_relationship_types {
  relationship_type_id integer [pk, increment]
  relationship_name varchar
  description varchar
  created_at timestamptz
  updated_at timestamptz
}

Table t_locations {
  location_id integer [pk, increment]
  name varchar
  address varchar
  lat decimal(9, 6)
  long decimal(9, 6)
  image_url varchar
  active boolean
  created_at timestamptz
  updated_at timestamptz
}

Table t_staff {
  staff_id integer [pk, increment]
  user_id integer [ref: - t_users.user_id]
  names varchar
  role_id integer [ref: > t_roles.role_id]
  father_last_name varchar
  mother_last_name varchar
  gender_id integer [ref: > t_genders.gender_id]
  city varchar
  district varchar
  address varchar
  contract_url varchar
  document_type_id integer [ref: > t_document_types.document_type_id]
  document varchar
  mail varchar
  phone_number varchar
  location_id integer [ref: > t_locations.location_id]
  active boolean
  entry_date date [default: `now()`]
  created_at timestamptz
  updated_at timestamptz
}

Table t_clients {
  client_id integer [pk, increment]
  user_id integer [ref: - t_users.user_id]
  role_id integer [ref: > t_roles.role_id]
  names varchar
  father_last_name varchar
  mother_last_name varchar
  image_url varchar
  mail varchar
  phone_number varchar
  gender_id integer [ref: > t_genders.gender_id]
  address varchar
  country varchar
  city varchar
  document_type_id integer [ref: > t_document_types.document_type_id]
  document varchar
  birth_date date
  staff_id integer [ref: > t_staff.staff_id]
  emergency_contact varchar
  emergency_contact_phone_number varchar
  relationship_type_id integer [ref: > t_relationship_types.relationship_type_id]
  location_id integer [ref: > t_locations.location_id]
  entry_date date [default: `now()`]
  created_at timestamptz
  updated_at timestamptz
}

Table t_attendance_tiers{
  attendance_tier_id integer [pk, increment]
  name varchar
  description text
  created_at timestamptz
  updated_at timestamptz
}

Table t_achievement_tiers {
  achievement_tier_id integer [pk, increment]
  name varchar
  description text
  created_at timestamptz
  updated_at timestamptz
}

Table t_goals {
  goal_id integer [pk, increment]
  name varchar
  created_at timestamptz
  updated_at timestamptz
}

Table t_product_types {
  product_type_id integer [pk, increment]
  product_type_name varchar
  description text
  created_at timestamptz
  updated_at timestamptz
}

Table t_exercise_types {
  exercise_type_id integer [pk, increment]
  name varchar
  description text
  created_at timestamptz
  updated_at timestamptz
}

Table t_exercises {
  exercise_id integer [pk, increment]
  exercise_type_id integer [ref: > t_exercise_types.exercise_type_id]
  name varchar
  description text
  image_url varchar
  active boolean
  created_at timestamptz
  updated_at timestamptz
}

Table t_training_plans {
  training_plan_id integer [pk, increment]
  client_id integer [ref: > t_clients.client_id]
  training_assignment_date date
  name varchar
  description text
  created_at timestamptz
  updated_at timestamptz
}

Table t_memberships {
  membership_id integer [pk, increment]
  name varchar
  price double
  description text
  active boolean
  created_at timestamptz
  updated_at timestamptz
}

Table t_body_metrics {
  body_metric_id integer [pk, increment]
  metric_date date
  client_id integer [ref: - t_clients.client_id]
  height double
  weight double
  chest_cm double
  waist_cm double
  hip_cm double
  arm_cm double
  thigh_cm double
  shoulder_cm double
  goal_id integer [ref: > t_goals.goal_id]
  ideal_weight double
  imc double
  created_at timestamptz
  updated_at timestamptz
}

Table t_client_tiers {
  client_id integer [pk ,ref: - t_clients.client_id]
  attendance_tier_id integer [ref: > t_attendance_tiers.attendance_tier_id]
  achievement_tier_id integer [ref: > t_achievement_tiers.achievement_tier_id]
  created_at timestamptz
  updated_at timestamptz
}

Table t_training_plan_days {
  training_plan_day_id integer [pk, increment]
  training_plan_id integer [ref: > t_training_plans.training_plan_id]
  day integer
  focus varchar
  created_at timestamptz
  updated_at timestamptz
}

Table t_day_exercises {
  day_exercise_id integer [pk, increment]
  training_plan_day_id integer [ref: > t_training_plan_days.training_plan_day_id]
  exercise_id integer [ref: > t_exercises.exercise_id]
  sets integer
  reps integer
  created_at timestamptz
  updated_at timestamptz
}

Table t_client_memberships {
  client_membership_id integer [pk, increment]
  client_id integer [ref: - t_clients.client_id]
  membership_id integer [ref: > t_memberships.membership_id]
  membership_start_date date
  payment_frequency_months integer
  created_at timestamptz
  updated_at timestamptz
}

Table t_client_attendances {
  client_attendance_id integer [pk, increment]
  client_id integer [ref: > t_clients.client_id]
  attendance_date date
  created_at timestamptz
  updated_at timestamptz
}

Table t_client_visits {
  client_visit_id integer [pk, increment]
  client_id integer [ref: > t_clients.client_id]
  visit_date date
  created_at timestamptz
  updated_at timestamptz
}

Table t_gym_equipment {
  gym_equipment_id integer [pk, increment]
  location_id integer [ref: > t_locations.location_id]
  name varchar
  description text
  last_maintenance_date date
  installation_date date
  created_at timestamptz
  updated_at timestamptz
}

Table t_staff_attendances {
  staff_attendance_id integer [pk, increment]
  staff_id integer [ref: > t_staff.staff_id]
  date date
  entry_time timestamptz
  exit_time timestamptz
  created_at timestamptz
  updated_at timestamptz
}

Table t_guests {
  guest_id integer [pk, increment]
  client_id integer [ref: > t_clients.client_id]
  names varchar
  father_last_name varchar
  mother_last_name varchar
  document_type_id integer [ref: > t_document_types.document_type_id]
  document varchar
  mail varchar
  created_at timestamptz
  updated_at timestamptz
}

Table t_products {
  product_id integer [pk, increment]
  product_type_id integer [ref: > t_product_types.product_type_id]
  product_name varchar
  description text
  price double
  image_url varchar
  active boolean
  created_at timestamptz
  updated_at timestamptz
}

Table t_product_stock {
  product_stock_id integer [pk, increment]
  location_id integer [ref: > t_locations.location_id]
  product_id integer [ref: > t_products.product_id]
  quantity int
  created_at timestamptz
  updated_at timestamptz
}

Table t_reports {
  report_id integer [pk, increment]
  name varchar
  assignment_date date [default: `now()`]
  expense_incurred double
  created_at timestamptz
  updated_at timestamptz
}

Table t_report_purchases {
  report_purchase_id integer [pk, increment]
  report_id integer [ref: > t_reports.report_id]
  number_purchase integer
  product_id integer [ref: > t_products.product_id]
  purchase_date date
  purchase_quantity integer
  total_price double
  purchase_receipt_url varchar
  location_id integer [ref: > t_locations.location_id]
  created_at timestamptz
  updated_at timestamptz
}

Table t_treatment_plans {
  treatment_plan_id integer [pk, increment]
  client_id integer [ref: > t_clients.client_id]
  treatment_assignment_date date
  diagnosis text
  instructions text
  created_at timestamptz
  updated_at timestamptz
}

Table t_treatment_plan_sessions {
  t_treatment_plan_session_id integer [pk, increment]
  treatment_plan_id integer [ref: > t_treatment_plans.treatment_plan_id]
  sessions_number integer
  treatment_exercise_id integer [ref: > t_treatment_exercises.treatment_exercise_id]
  session_date date
  session_time time
  created_at timestamptz
  updated_at timestamptz
}

Table t_diet_plans {
  diet_plan_id integer [pk, increment]
  client_id integer [ref: > t_clients.client_id]
  name_plan varchar
  diet_assignment_date date
  start_date date
  end_date date
  protein_gr double
  carbohydrates_gr double
  daily_calories_kcal double
  created_at timestamptz
  updated_at timestamptz
}

Table t_diet_plan_days {
  diet_plan_day_id integer [pk, increment]
  diet_plan_id integer [ref: > t_diet_plans.diet_plan_id]
  day_number integer
  breakfast text
  lunch text
  dinner text
  notes text
  created_at timestamptz
  updated_at timestamptz
}

Table t_treatment_exercise_types {
  treatment_exercise_type_id integer [pk, increment]
  name varchar
  description text
  created_at timestamptz
  updated_at timestamptz
}

Table t_treatment_exercises {
  treatment_exercise_id integer [pk, increment]
  treatment_exercise_type_id integer [ref: > t_treatment_exercise_types.treatment_exercise_type_id]
  name varchar
  description text
  active boolean
  created_at timestamptz
  updated_at timestamptz
}

Table t_events {
  event_id integer [pk, increment]
  image_url varchar
  name varchar
  description text
  event_date date
  schedule time
  capacity integer
  location_id integer [ref: > t_locations.location_id]
  requirements text
  approved boolean [null]
  created_at timestamptz
  updated_at timestamptz
}

Table t_event_attendances {
  event_id integer [ref: - t_events.event_id]
  client_id integer [ref: - t_clients.client_id]
  created_at timestamptz
  updated_at timestamptz
}