PGDMP         )                z            week_1    14.2    14.2 %    %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            (           1262    16394    week_1    DATABASE     j   CREATE DATABASE week_1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE week_1;
                postgres    false            �            1259    25099    country_new    TABLE     �   CREATE TABLE public.country_new (
    country_id character(1)[] NOT NULL,
    country_name character varying[],
    region_id integer
);
    DROP TABLE public.country_new;
       public         heap    postgres    false            �            1259    25123    departments    TABLE     �   CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying[],
    manager_id integer,
    location_id integer
);
    DROP TABLE public.departments;
       public         heap    postgres    false            �            1259    25159 	   employees    TABLE     g  CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    fisrt_name character varying[],
    last_name character varying[],
    email character varying[],
    phone_number character varying[],
    hire_date date,
    job_id character varying[],
    salary integer,
    commission_pct integer,
    manager_id integer,
    department_id integer
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    25181 
   job_grades    TABLE     �   CREATE TABLE public.job_grades (
    grade_level character varying[] NOT NULL,
    lowest_sal integer,
    highest_sal integer
);
    DROP TABLE public.job_grades;
       public         heap    postgres    false            �            1259    25142    job_history    TABLE     �   CREATE TABLE public.job_history (
    employee_id integer NOT NULL,
    start_date date,
    end_date date,
    job_id character varying[],
    department_id integer
);
    DROP TABLE public.job_history;
       public         heap    postgres    false            �            1259    25135    jobs    TABLE     �   CREATE TABLE public.jobs (
    job_id character varying[] NOT NULL,
    job_title character varying[],
    min_salary integer,
    max_salary integer
);
    DROP TABLE public.jobs;
       public         heap    postgres    false            �            1259    25111 	   locations    TABLE     �   CREATE TABLE public.locations (
    id integer NOT NULL,
    street_address character varying[],
    postal_code character varying[],
    state character varying[],
    region_id character(1)[],
    location_id integer,
    country_id integer
);
    DROP TABLE public.locations;
       public         heap    postgres    false            �            1259    25092    regions    TABLE     e   CREATE TABLE public.regions (
    region_id integer NOT NULL,
    region_name character varying[]
);
    DROP TABLE public.regions;
       public         heap    postgres    false                      0    25099    country_new 
   TABLE DATA           J   COPY public.country_new (country_id, country_name, region_id) FROM stdin;
    public          postgres    false    210   K,                 0    25123    departments 
   TABLE DATA           ^   COPY public.departments (department_id, department_name, manager_id, location_id) FROM stdin;
    public          postgres    false    212   h,       !          0    25159 	   employees 
   TABLE DATA           �   COPY public.employees (employee_id, fisrt_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) FROM stdin;
    public          postgres    false    215   �,       "          0    25181 
   job_grades 
   TABLE DATA           J   COPY public.job_grades (grade_level, lowest_sal, highest_sal) FROM stdin;
    public          postgres    false    216   �,                  0    25142    job_history 
   TABLE DATA           _   COPY public.job_history (employee_id, start_date, end_date, job_id, department_id) FROM stdin;
    public          postgres    false    214   �,                 0    25135    jobs 
   TABLE DATA           I   COPY public.jobs (job_id, job_title, min_salary, max_salary) FROM stdin;
    public          postgres    false    213   �,                 0    25111 	   locations 
   TABLE DATA           o   COPY public.locations (id, street_address, postal_code, state, region_id, location_id, country_id) FROM stdin;
    public          postgres    false    211   �,                 0    25092    regions 
   TABLE DATA           9   COPY public.regions (region_id, region_name) FROM stdin;
    public          postgres    false    209   -       z           2606    25105    country_new countries_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.country_new
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);
 D   ALTER TABLE ONLY public.country_new DROP CONSTRAINT countries_pkey;
       public            postgres    false    210            ~           2606    25129    departments departments_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);
 F   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_pkey;
       public            postgres    false    212            �           2606    25165    employees employees_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    215            �           2606    25187    job_grades job_grades_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.job_grades
    ADD CONSTRAINT job_grades_pkey PRIMARY KEY (grade_level);
 D   ALTER TABLE ONLY public.job_grades DROP CONSTRAINT job_grades_pkey;
       public            postgres    false    216            �           2606    25148    job_history job_history_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT job_history_pkey PRIMARY KEY (employee_id);
 F   ALTER TABLE ONLY public.job_history DROP CONSTRAINT job_history_pkey;
       public            postgres    false    214            �           2606    25141    jobs jobs_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            postgres    false    213            |           2606    25117    locations locations_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public            postgres    false    211            x           2606    25098    regions regions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (region_id);
 >   ALTER TABLE ONLY public.regions DROP CONSTRAINT regions_pkey;
       public            postgres    false    209            �           2606    25118    locations fk_country    FK CONSTRAINT     �   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT fk_country FOREIGN KEY (region_id) REFERENCES public.country_new(country_id);
 >   ALTER TABLE ONLY public.locations DROP CONSTRAINT fk_country;
       public          postgres    false    211    210    3194            �           2606    25149    job_history fk_department    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES public.departments(department_id);
 C   ALTER TABLE ONLY public.job_history DROP CONSTRAINT fk_department;
       public          postgres    false    214    212    3198            �           2606    25176    employees fk_department_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_department_2 FOREIGN KEY (department_id) REFERENCES public.departments(department_id);
 C   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_department_2;
       public          postgres    false    212    215    3198            �           2606    25171    employees fk_job_his    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_job_his FOREIGN KEY (employee_id) REFERENCES public.job_history(employee_id);
 >   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_job_his;
       public          postgres    false    215    3202    214            �           2606    25154    job_history fk_jobs    FK CONSTRAINT     t   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT fk_jobs FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);
 =   ALTER TABLE ONLY public.job_history DROP CONSTRAINT fk_jobs;
       public          postgres    false    214    213    3200            �           2606    25166    employees fk_jobs_2    FK CONSTRAINT     t   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_jobs_2 FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);
 =   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_jobs_2;
       public          postgres    false    215    213    3200            �           2606    25130    departments fk_location    FK CONSTRAINT     ~   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES public.locations(id);
 A   ALTER TABLE ONLY public.departments DROP CONSTRAINT fk_location;
       public          postgres    false    3196    212    211            �           2606    25106    country_new fk_region    FK CONSTRAINT        ALTER TABLE ONLY public.country_new
    ADD CONSTRAINT fk_region FOREIGN KEY (region_id) REFERENCES public.regions(region_id);
 ?   ALTER TABLE ONLY public.country_new DROP CONSTRAINT fk_region;
       public          postgres    false    210    3192    209            �           2606    25189 #   job_history job_history_job_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT job_history_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);
 M   ALTER TABLE ONLY public.job_history DROP CONSTRAINT job_history_job_id_fkey;
       public          postgres    false    213    214    3200                  x������ � �            x������ � �      !      x������ � �      "      x������ � �             x������ � �            x������ � �            x������ � �            x������ � �     