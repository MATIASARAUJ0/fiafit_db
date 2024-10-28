-- CREACIÓN DE LA FUNCIÓN
CREATE OR REPLACE FUNCTION update_modified_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- PARA QUE CREES TU PROPIO TRIGGER EN CASO HAGAS PRUEBAS
-- CON OTRAS TABLAS
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON nombre_de_tu_tabla
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();


-- TRIGGER PARA TODAS LAS TABLAS DEL MODELO

CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_users
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_roles
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_genders
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_document_types
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_relationship_types
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_locations
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_staff
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_clients
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_attendance_tiers
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_achievement_tiers
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_goals
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_product_types
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_exercise_types
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_exercises
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_training_plans
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_memberships
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_body_metrics
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_client_tiers
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_training_plan_days
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_day_exercises
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_client_memberships
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_client_attendances
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_client_visits
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_gym_equipment
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_staff_attendances
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_guests
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_products
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_product_stock
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_reports
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_report_purchases
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_treatment_plans
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_treatment_plan_sessions
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_diet_plans
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_diet_plan_days
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_treatment_exercise_types
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_treatment_exercises
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_events
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON t_event_attendances
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();