/* Table: serv_header

id (int, single)
created_at (epochms, single)
nombre (text, single)
telefono (text, single)
email (email, single)
descr_servicios (text, single)

Table: serv_detalle
id (int, single)
created_at (epochms, single)
id_header (int, single, references serv_header)
id_servicio (int, single, references servicios_limpieza)


Table: servicios_limpieza

id (int, single)
created_at (epochms, single)
seleccionado (bool, single)
titulo (text, single)
descripcion (text, single)
imagen (text, single) */
