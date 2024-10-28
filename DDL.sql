-- Tabla t_users
CREATE TABLE t_users (
    user_id SERIAL PRIMARY KEY,
    "user" VARCHAR NOT NULL UNIQUE,
    "password" VARCHAR NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabla t_roles
CREATE TABLE t_roles (
    role_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabla t_genders
CREATE TABLE t_genders (
    gender_id SERIAL PRIMARY KEY,
    gender VARCHAR NOT NULL UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabla t_document_types
CREATE TABLE t_document_types (
    document_type_id SERIAL PRIMARY KEY,
    document_name VARCHAR NOT NULL,
    acronyms VARCHAR UNIQUE,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabla t_relationship_types
CREATE TABLE t_relationship_types (
    relationship_type_id SERIAL PRIMARY KEY,
    relationship_name VARCHAR NOT NULL UNIQUE,
    description VARCHAR,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabla t_locations
CREATE TABLE t_locations (
    location_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    address VARCHAR,
    lat DECIMAL(9, 6),
    long DECIMAL(9, 6),
    image_url VARCHAR,
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Creación de tabla t_staff
CREATE TABLE t_staff (
    staff_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES t_users(user_id) ON DELETE SET NULL UNIQUE,
    names VARCHAR NOT NULL,
    role_id INTEGER REFERENCES t_roles(role_id) ON DELETE SET NULL,
    father_last_name VARCHAR NOT NULL,
    mother_last_name VARCHAR NOT NULL,
    gender_id INTEGER REFERENCES t_genders(gender_id) ON DELETE SET NULL,
    city VARCHAR,
    district VARCHAR,
    address VARCHAR,
    contract_url VARCHAR,
    document_type_id INTEGER REFERENCES t_document_types(document_type_id) ON DELETE SET NULL,
    document VARCHAR UNIQUE,
    mail VARCHAR,
    phone_number VARCHAR,
    location_id INTEGER REFERENCES t_locations(location_id) ON DELETE SET NULL,
    active BOOLEAN DEFAULT TRUE,
    entry_date DATE DEFAULT CURRENT_DATE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table t_clients
CREATE TABLE t_clients (
    client_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES t_users(user_id) ON DELETE SET NULL UNIQUE,
    role_id INTEGER REFERENCES t_roles(role_id) ON DELETE SET NULL,
    names VARCHAR NOT NULL,
    father_last_name VARCHAR NOT NULL,
    mother_last_name VARCHAR NOT NULL,
    image_url VARCHAR,
    mail VARCHAR NOT NULL,
    phone_number VARCHAR NOT NULL,
    gender_id INTEGER REFERENCES t_genders(gender_id) ON DELETE SET NULL,
    address VARCHAR NOT NULL,
    country VARCHAR NOT NULL,
    city VARCHAR NOT NULL,
    document_type_id INTEGER REFERENCES t_document_types(document_type_id) ON DELETE SET NULL,
    document VARCHAR NOT NULL UNIQUE,
    birth_date DATE NOT NULL,
    staff_id INTEGER REFERENCES t_staff(staff_id) ON DELETE SET NULL,
    emergency_contact VARCHAR,
    emergency_contact_phone_number VARCHAR,
    relationship_type_id INTEGER REFERENCES t_relationship_types(relationship_type_id) ON DELETE SET NULL,
    location_id INTEGER REFERENCES t_locations(location_id) ON DELETE SET NULL,
    entry_date DATE DEFAULT CURRENT_DATE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabla t_attendance_tiers
CREATE TABLE t_attendance_tiers (
    attendance_tier_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabla t_achievement_tiers
CREATE TABLE t_achievement_tiers (
    achievement_tier_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabla t_goals
CREATE TABLE t_goals (
    goal_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabla t_product_types
CREATE TABLE t_product_types (
    product_type_id SERIAL PRIMARY KEY,
    product_type_name VARCHAR NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Creación de tabla t_exercise_types
CREATE TABLE t_exercise_types (
    exercise_type_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Creación de tabla t_exercises
CREATE TABLE t_exercises (
    exercise_id SERIAL PRIMARY KEY,
    exercise_type_id INTEGER REFERENCES t_exercise_types(exercise_type_id) ON DELETE CASCADE,
    name VARCHAR NOT NULL UNIQUE,
    description TEXT,
    image_url VARCHAR,
    active BOOLEAN,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Creación de tabla t_training_plans
CREATE TABLE t_training_plans (
    training_plan_id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES t_clients(client_id) ON DELETE CASCADE,
    training_assignment_date DATE,
    name VARCHAR NOT NULL,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Creación de tabla t_memberships
CREATE TABLE t_memberships (
    membership_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    price DOUBLE PRECISION NOT NULL,
    description TEXT,
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Creación de tabla t_body_metrics
CREATE TABLE t_body_metrics (
    body_metric_id SERIAL PRIMARY KEY,
    metric_date DATE NOT NULL,
    client_id INTEGER REFERENCES t_clients(client_id) ON DELETE CASCADE,
    height DOUBLE PRECISION,
    weight DOUBLE PRECISION,
    chest_cm DOUBLE PRECISION,
    waist_cm DOUBLE PRECISION,
    hip_cm DOUBLE PRECISION,
    arm_cm DOUBLE PRECISION,
    thigh_cm DOUBLE PRECISION,
    shoulder_cm DOUBLE PRECISION,
    goal_id INTEGER REFERENCES t_goals(goal_id) ON DELETE SET NULL,
    ideal_weight DOUBLE PRECISION,
    imc DOUBLE PRECISION,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Creación de tabla t_client_tiers
CREATE TABLE t_client_tiers (
    client_id INTEGER PRIMARY KEY REFERENCES t_clients(client_id) ON DELETE CASCADE,
    attendance_tier_id INTEGER REFERENCES t_attendance_tiers(attendance_tier_id) ON DELETE SET NULL,
    achievement_tier_id INTEGER REFERENCES t_achievement_tiers(achievement_tier_id) ON DELETE SET NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Creación de tabla t_training_plan_days
CREATE TABLE t_training_plan_days (
    training_plan_day_id SERIAL PRIMARY KEY,
    training_plan_id INTEGER REFERENCES t_training_plans(training_plan_id) ON DELETE CASCADE,
    day INTEGER NOT NULL,
    focus VARCHAR NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Creación de tabla t_day_exercises
CREATE TABLE t_day_exercises (
    day_exercise_id SERIAL PRIMARY KEY,
    training_plan_day_id INTEGER REFERENCES t_training_plan_days(training_plan_day_id) ON DELETE CASCADE,
    exercise_id INTEGER REFERENCES t_exercises(exercise_id) ON DELETE CASCADE,
    sets INTEGER NOT NULL,
    reps INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table t_client_memberships
CREATE TABLE t_client_memberships (
    client_membership_id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES t_clients(client_id) ON DELETE CASCADE,
    membership_id INTEGER REFERENCES t_memberships(membership_id) ON DELETE SET NULL,
    membership_start_date DATE NOT NULL,
    payment_frequency_months INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table t_client_attendances
CREATE TABLE t_client_attendances (
    client_attendance_id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES t_clients(client_id) ON DELETE CASCADE,
    attendance_date DATE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table t_client_visits
CREATE TABLE t_client_visits (
    client_visit_id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES t_clients(client_id) ON DELETE CASCADE,
    visit_date DATE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table t_gym_equipment
CREATE TABLE t_gym_equipment (
    gym_equipment_id SERIAL PRIMARY KEY,
    location_id INTEGER REFERENCES t_locations(location_id) ON DELETE CASCADE,
    name VARCHAR NOT NULL,
    description TEXT,
    last_maintenance_date DATE,
    installation_date DATE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table t_staff_attendances
CREATE TABLE t_staff_attendances (
    staff_attendance_id SERIAL PRIMARY KEY,
    staff_id INTEGER REFERENCES t_staff(staff_id) ON DELETE CASCADE,
    date DATE NOT NULL,
    entry_time TIMESTAMP WITH TIME ZONE,
    exit_time TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 1. Tabla t_guests
CREATE TABLE t_guests (
    guest_id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES t_clients(client_id) ON DELETE CASCADE,
    names VARCHAR,
    father_last_name VARCHAR,
    mother_last_name VARCHAR,
    document_type_id INTEGER REFERENCES t_document_types(document_type_id) ON DELETE SET NULL,
    document VARCHAR,
    mail VARCHAR,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabla t_products
CREATE TABLE t_products (
    product_id SERIAL PRIMARY KEY,
    product_type_id INTEGER REFERENCES t_product_types(product_type_id) ON DELETE SET NULL,
    product_name VARCHAR UNIQUE,
    description TEXT,
    price DOUBLE PRECISION,
    image_url VARCHAR,
    active BOOLEAN,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 3. Tabla t_product_stock
CREATE TABLE t_product_stock (
    product_stock_id SERIAL PRIMARY KEY,
    location_id INTEGER REFERENCES t_locations(location_id) ON DELETE CASCADE,
    product_id INTEGER REFERENCES t_products(product_id) ON DELETE CASCADE,
    quantity INTEGER,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 4. Tabla t_reports
CREATE TABLE t_reports (
    report_id SERIAL PRIMARY KEY,
    name VARCHAR UNIQUE,
    assignment_date DATE DEFAULT CURRENT_DATE,
    expense_incurred DOUBLE PRECISION,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 5. Tabla t_report_purchases
CREATE TABLE t_report_purchases (
    report_purchase_id SERIAL PRIMARY KEY,
    report_id INTEGER REFERENCES t_reports(report_id) ON DELETE CASCADE,
    number_purchase INTEGER,
    product_id INTEGER REFERENCES t_products(product_id) ON DELETE SET NULL,
    purchase_date DATE,
    purchase_quantity INTEGER,
    total_price DOUBLE PRECISION,
    purchase_receipt_url VARCHAR,
    location_id INTEGER REFERENCES t_locations(location_id) ON DELETE SET NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabla: t_treatment_plans
CREATE TABLE t_treatment_plans (
    treatment_plan_id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES t_clients(client_id) ON DELETE CASCADE,
    treatment_assignment_date DATE,
    diagnosis TEXT,
    instructions TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabla: t_treatment_plan_sessions
CREATE TABLE t_treatment_plan_sessions (
    t_treatment_plan_session_id SERIAL PRIMARY KEY,
    treatment_plan_id INTEGER REFERENCES t_treatment_plans(treatment_plan_id) ON DELETE CASCADE,
    sessions_number INTEGER,
    treatment_exercise_id INTEGER t_treatment_exercises(treatment_exercise_id) ON SET NULL,
    session_date DATE,
    session_time TIME,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabla: t_diet_plans
CREATE TABLE t_diet_plans (
    diet_plan_id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES t_clients(client_id) ON DELETE CASCADE,
    name_plan VARCHAR,
    diet_assignment_date DATE,
    start_date DATE,
    end_date DATE,
    protein_gr DOUBLE PRECISION,
    carbohydrates_gr DOUBLE PRECISION,
    daily_calories_kcal DOUBLE PRECISION,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabla: t_diet_plan_days
CREATE TABLE t_diet_plan_days (
    diet_plan_day_id SERIAL PRIMARY KEY,
    diet_plan_id INTEGER REFERENCES t_diet_plans(diet_plan_id) ON DELETE CASCADE,
    day_number INTEGER,
    breakfast TEXT,
    lunch TEXT,
    dinner TEXT,
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE t_treatment_exercise_types (
    treatment_exercise_type_id SERIAL PRIMARY KEY,
    name VARCHAR UNIQUE,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE t_treatment_exercises (
    treatment_exercise_id SERIAL PRIMARY KEY,
    treatment_exercise_type_id INTEGER REFERENCES t_treatment_exercise_types(treatment_exercise_type_id) ON DELETE CASCADE,
    name VARCHAR UNIQUE,
    description TEXT,
    active BOOLEAN,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE t_events (
    event_id SERIAL PRIMARY KEY,
    image_url VARCHAR,
    name VARCHAR NOT NULL,
    description TEXT,
    event_date DATE NOT NULL,
    schedule TIME,
    capacity INTEGER,
    location_id INTEGER REFERENCES t_locations(location_id) ON DELETE SET NULL,
    requirements TEXT,
    approved BOOLEAN DEFAULT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE t_event_attendances (
    event_id INTEGER REFERENCES t_events(event_id) ON DELETE CASCADE,
    client_id INTEGER REFERENCES t_clients(client_id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);