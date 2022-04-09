PGDMP     6            	        z            week_1    14.2    14.2 #    #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            &           1262    25576    week_1    DATABASE     j   CREATE DATABASE week_1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE week_1;
                postgres    false            �            1259    26011    country_new    TABLE     �   CREATE TABLE public.country_new (
    country_id character(2) NOT NULL,
    country_name character varying(40),
    region_id integer
);
    DROP TABLE public.country_new;
       public         heap    postgres    false            �            1259    26036    departments    TABLE     �   CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(30),
    manager_id integer,
    location_id integer
);
    DROP TABLE public.departments;
       public         heap    postgres    false            �            1259    26063 	   employees    TABLE     q  CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name character varying(20),
    last_name character varying(25),
    email character varying(25),
    phone_number character varying(20),
    hire_date date,
    job_id character varying(10),
    salary integer,
    commission_pct integer,
    manager_id integer,
    department_id integer
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    26083 
   job_grades    TABLE     �   CREATE TABLE public.job_grades (
    grade_level character varying(2) NOT NULL,
    lowest_sal integer,
    highest_sal integer
);
    DROP TABLE public.job_grades;
       public         heap    postgres    false            �            1259    26046    job_history    TABLE     �   CREATE TABLE public.job_history (
    employee_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date,
    job_id character varying(10),
    department_id integer
);
    DROP TABLE public.job_history;
       public         heap    postgres    false            �            1259    26031    jobs    TABLE     �   CREATE TABLE public.jobs (
    job_id character varying(10) NOT NULL,
    job_title character varying(35),
    min_salary integer,
    max_salary integer
);
    DROP TABLE public.jobs;
       public         heap    postgres    false            �            1259    26021 	   locations    TABLE       CREATE TABLE public.locations (
    id integer NOT NULL,
    street_address character varying(25),
    postal_code character varying(12),
    state character varying(12),
    region_id character(2),
    location_id integer NOT NULL,
    country_id integer NOT NULL
);
    DROP TABLE public.locations;
       public         heap    postgres    false            �            1259    26006    regions    TABLE     g   CREATE TABLE public.regions (
    region_id integer NOT NULL,
    region_name character varying(25)
);
    DROP TABLE public.regions;
       public         heap    postgres    false                      0    26011    country_new 
   TABLE DATA           J   COPY public.country_new (country_id, country_name, region_id) FROM stdin;
    public          postgres    false    210   �)                 0    26036    departments 
   TABLE DATA           ^   COPY public.departments (department_id, department_name, manager_id, location_id) FROM stdin;
    public          postgres    false    213   �)                 0    26063 	   employees 
   TABLE DATA           �   COPY public.employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) FROM stdin;
    public          postgres    false    215   �)                  0    26083 
   job_grades 
   TABLE DATA           J   COPY public.job_grades (grade_level, lowest_sal, highest_sal) FROM stdin;
    public          postgres    false    216   *                 0    26046    job_history 
   TABLE DATA           _   COPY public.job_history (employee_id, start_date, end_date, job_id, department_id) FROM stdin;
    public          postgres    false    214   )*                 0    26031    jobs 
   TABLE DATA           I   COPY public.jobs (job_id, job_title, min_salary, max_salary) FROM stdin;
    public          postgres    false    212   F*                 0    26021 	   locations 
   TABLE DATA           o   COPY public.locations (id, street_address, postal_code, state, region_id, location_id, country_id) FROM stdin;
    public          postgres    false    211   c*                 0    26006    regions 
   TABLE DATA           9   COPY public.regions (region_id, region_name) FROM stdin;
    public          postgres    false    209   �*       z           2606    26015    country_new country_id_key 
   CONSTRAINT     `   ALTER TABLE ONLY public.country_new
    ADD CONSTRAINT country_id_key PRIMARY KEY (country_id);
 D   ALTER TABLE ONLY public.country_new DROP CONSTRAINT country_id_key;
       public            postgres    false    210            ~           2606    26040    departments department_id_key 
   CONSTRAINT     f   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT department_id_key PRIMARY KEY (department_id);
 G   ALTER TABLE ONLY public.departments DROP CONSTRAINT department_id_key;
       public            postgres    false    213            �           2606    26067    employees employee_id_key 
   CONSTRAINT     `   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employee_id_key PRIMARY KEY (employee_id);
 C   ALTER TABLE ONLY public.employees DROP CONSTRAINT employee_id_key;
       public            postgres    false    215            �           2606    26087    job_grades job_grades_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.job_grades
    ADD CONSTRAINT job_grades_pkey PRIMARY KEY (grade_level);
 D   ALTER TABLE ONLY public.job_grades DROP CONSTRAINT job_grades_pkey;
       public            postgres    false    216            �           2606    26052 '   job_history job_history_employee_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT job_history_employee_id_key UNIQUE (employee_id);
 Q   ALTER TABLE ONLY public.job_history DROP CONSTRAINT job_history_employee_id_key;
       public            postgres    false    214            |           2606    26035    jobs jobs_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            postgres    false    212            �           2606    26050    job_history pk_job_his 
   CONSTRAINT     i   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT pk_job_his PRIMARY KEY (employee_id, start_date);
 @   ALTER TABLE ONLY public.job_history DROP CONSTRAINT pk_job_his;
       public            postgres    false    214    214            x           2606    26010    regions regions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (region_id);
 >   ALTER TABLE ONLY public.regions DROP CONSTRAINT regions_pkey;
       public            postgres    false    209            �           2606    26026    locations fk_country    FK CONSTRAINT     �   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT fk_country FOREIGN KEY (region_id) REFERENCES public.country_new(country_id);
 >   ALTER TABLE ONLY public.locations DROP CONSTRAINT fk_country;
       public          postgres    false    210    211    3194            �           2606    26053    job_history fk_department    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES public.departments(department_id);
 C   ALTER TABLE ONLY public.job_history DROP CONSTRAINT fk_department;
       public          postgres    false    213    214    3198            �           2606    26078    employees fk_department_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_department_2 FOREIGN KEY (department_id) REFERENCES public.departments(department_id);
 C   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_department_2;
       public          postgres    false    3198    215    213            �           2606    26068    employees fk_employee    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES public.job_history(employee_id);
 ?   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_employee;
       public          postgres    false    215    214    3200            �           2606    26058    job_history fk_job    FK CONSTRAINT     s   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT fk_job FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);
 <   ALTER TABLE ONLY public.job_history DROP CONSTRAINT fk_job;
       public          postgres    false    3196    212    214            �           2606    26073    employees fk_job_2    FK CONSTRAINT     s   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_job_2 FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);
 <   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_job_2;
       public          postgres    false    3196    212    215            �           2606    26016    country_new fk_region    FK CONSTRAINT        ALTER TABLE ONLY public.country_new
    ADD CONSTRAINT fk_region FOREIGN KEY (region_id) REFERENCES public.regions(region_id);
 ?   ALTER TABLE ONLY public.country_new DROP CONSTRAINT fk_region;
       public          postgres    false    209    3192    210                  x������ � �            x������ � �            x������ � �             x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     