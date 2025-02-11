CREATE TABLE "Work_Area"(
    "id" BIGINT NOT NULL,
    "code" VARCHAR(255) NOT NULL,
    "name" BIGINT NOT NULL
);
ALTER TABLE
    "Work_Area" ADD PRIMARY KEY("id");
CREATE TABLE "Work_SubArea"(
    "id" BIGINT NOT NULL,
    "code" VARCHAR(255) NOT NULL,
    "WorkAreaid" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Work_SubArea" ADD PRIMARY KEY("id");
CREATE TABLE "Employee_Actions"(
    "id" BIGINT NOT NULL,
    "code" VARCHAR(255) NOT NULL,
    "action_type" VARCHAR(255) CHECK
        ("action_type" IN('')) NOT NULL,
        "employee_id" BIGINT NOT NULL,
        "action_date" DATE NOT NULL,
        "previous_status" VARCHAR(255)
    CHECK
        ("previous_status" IN('')) NOT NULL,
        "new_status" VARCHAR(255)
    CHECK
        ("new_status" IN('')) NOT NULL
);
ALTER TABLE
    "Employee_Actions" ADD PRIMARY KEY("id");
CREATE TABLE "Employee_Contact"(
    "id" BIGINT NOT NULL,
    "Full_Address" VARCHAR(255) NOT NULL,
    "street_1" VARCHAR(255) NOT NULL,
    "street_2" VARCHAR(255) NULL,
    "region_name" VARCHAR(255) NULL,
    "province_code" VARCHAR(255) NOT NULL,
    "nation_code" VARCHAR(255) NOT NULL,
    "mailing_code" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NULL,
    "phone" VARCHAR(255) NULL
);
ALTER TABLE
    "Employee_Contact" ADD PRIMARY KEY("id");
CREATE TABLE "Bargining_Type"(
    "id" BIGINT NOT NULL,
    "code" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Bargining_Type" ADD PRIMARY KEY("id");
CREATE TABLE "Leave_Entitlements"(
    "id" BIGINT NOT NULL,
    "leave_code" VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "build_up" BOOLEAN NOT NULL,
    "carryover" BIGINT NOT NULL,
    "hour_value" BIGINT NOT NULL
);
ALTER TABLE
    "Leave_Entitlements" ADD PRIMARY KEY("id");
CREATE TABLE "Leave_Amounts"(
    "id" BIGINT NOT NULL,
    "employee_id" BIGINT NOT NULL,
    "LeaveType_id" BIGINT NOT NULL,
    "previous amount" BIGINT NOT NULL,
    "new_amount" BIGINT NOT NULL,
    "effective_date" BIGINT NOT NULL
);
ALTER TABLE
    "Leave_Amounts" ADD PRIMARY KEY("id");
CREATE TABLE "position_level"("id" BIGINT NOT NULL);
ALTER TABLE
    "position_level" ADD PRIMARY KEY("id");
CREATE TABLE "position_type"(
    "id" BIGINT NOT NULL,
    "code" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "effective_date_start" DATE NOT NULL,
    "effective_date_end" DATE NULL
);
ALTER TABLE
    "position_type" ADD PRIMARY KEY("id");
CREATE TABLE "shift_type"(
    "id" BIGINT NOT NULL,
    "code" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "overtime_available" BOOLEAN NOT NULL
);
ALTER TABLE
    "shift_type" ADD PRIMARY KEY("id");
CREATE TABLE "shift_group"(
    "id" BIGINT NOT NULL,
    "code" BIGINT NOT NULL,
    "name" BIGINT NOT NULL,
    "days_worked" BIGINT NOT NULL,
    "alternatetrue" BOOLEAN NOT NULL
);
ALTER TABLE
    "shift_group" ADD PRIMARY KEY("id");
CREATE TABLE "Planned Schedule"(
    "id" BIGINT NOT NULL,
    "code" VARCHAR(255) NOT NULL,
    "employee_id" BIGINT NOT NULL,
    "shift_type_id" BIGINT NOT NULL,
    "overtime_type_id" BIGINT NOT NULL,
    "shift_group_id" BIGINT NOT NULL
);
ALTER TABLE
    "Planned Schedule" ADD PRIMARY KEY("id");
CREATE TABLE "Overtime_Type"(
    "id" BIGINT NOT NULL,
    "code" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "bargaining" BOOLEAN NULL
);
ALTER TABLE
    "Overtime_Type" ADD PRIMARY KEY("id");
CREATE TABLE "OrgRegion"(
    "id" BIGINT NOT NULL,
    "RegionCode" VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "Address" VARCHAR(255) NOT NULL,
    "Province" VARCHAR(255) NOT NULL,
    "Nation" VARCHAR(255) NOT NULL,
    "PostalCode" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "OrgRegion" ADD PRIMARY KEY("id");
CREATE TABLE "Employee_Data"(
    "id" BIGINT NOT NULL,
    "code" VARCHAR(255) NOT NULL,
    "first_name" CHAR(255) NOT NULL,
    "last_name" CHAR(255) NOT NULL,
    "contact_id" BIGINT NOT NULL,
    "bargining_id" BIGINT NOT NULL,
    "work_area_id" BIGINT NOT NULL,
    "work_subarea_id" BIGINT NOT NULL,
    "postition_type_id" BIGINT NOT NULL,
    "birth_date" DATE NOT NULL,
    "hire_date" DATE NOT NULL,
    "position_level_id" BIGINT NOT NULL,
    "orgregion_id" BIGINT NOT NULL
);
ALTER TABLE
    "Employee_Data" ADD PRIMARY KEY("id");
ALTER TABLE
    "Employee_Data" ADD CONSTRAINT "employee_data_orgregion_id_foreign" FOREIGN KEY("orgregion_id") REFERENCES "OrgRegion"("id");
ALTER TABLE
    "Planned Schedule" ADD CONSTRAINT "planned schedule_shift_group_id_foreign" FOREIGN KEY("shift_group_id") REFERENCES "shift_group"("id");
ALTER TABLE
    "Employee_Data" ADD CONSTRAINT "employee_data_position_level_id_foreign" FOREIGN KEY("position_level_id") REFERENCES "position_level"("id");
ALTER TABLE
    "Employee_Actions" ADD CONSTRAINT "employee_actions_employee_id_foreign" FOREIGN KEY("employee_id") REFERENCES "Employee_Data"("id");
ALTER TABLE
    "Leave_Amounts" ADD CONSTRAINT "leave_amounts_leavetype_id_foreign" FOREIGN KEY("LeaveType_id") REFERENCES "Leave_Entitlements"("id");
ALTER TABLE
    "Planned Schedule" ADD CONSTRAINT "planned schedule_employee_id_foreign" FOREIGN KEY("employee_id") REFERENCES "Employee_Data"("id");
ALTER TABLE
    "Planned Schedule" ADD CONSTRAINT "planned schedule_overtime_type_id_foreign" FOREIGN KEY("overtime_type_id") REFERENCES "Overtime_Type"("id");
ALTER TABLE
    "Employee_Data" ADD CONSTRAINT "employee_data_work_subarea_id_foreign" FOREIGN KEY("work_subarea_id") REFERENCES "Work_SubArea"("id");
ALTER TABLE
    "Leave_Amounts" ADD CONSTRAINT "leave_amounts_employee_id_foreign" FOREIGN KEY("employee_id") REFERENCES "Employee_Data"("id");
ALTER TABLE
    "Planned Schedule" ADD CONSTRAINT "planned schedule_shift_type_id_foreign" FOREIGN KEY("shift_type_id") REFERENCES "shift_type"("id");
ALTER TABLE
    "Employee_Data" ADD CONSTRAINT "employee_data_contact_id_foreign" FOREIGN KEY("contact_id") REFERENCES "Employee_Contact"("id");
ALTER TABLE
    "Employee_Data" ADD CONSTRAINT "employee_data_work_area_id_foreign" FOREIGN KEY("work_area_id") REFERENCES "Work_Area"("id");
ALTER TABLE
    "Work_SubArea" ADD CONSTRAINT "work_subarea_workareaid_foreign" FOREIGN KEY("WorkAreaid") REFERENCES "Work_Area"("id");
ALTER TABLE
    "Employee_Data" ADD CONSTRAINT "employee_data_bargining_id_foreign" FOREIGN KEY("bargining_id") REFERENCES "Bargining_Type"("id");
ALTER TABLE
    "Employee_Data" ADD CONSTRAINT "employee_data_postition_type_id_foreign" FOREIGN KEY("postition_type_id") REFERENCES "position_type"("id");