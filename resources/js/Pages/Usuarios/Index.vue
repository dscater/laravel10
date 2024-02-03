<script setup>
import BreadBrums from "@/Components/BreadBrums.vue";
import { useApp } from "@/composables/useApp";
import { useUsuarios } from "@/composables/useUsuarios";
import { useForm, usePage } from "@inertiajs/vue3";
import { ref, onMounted, computed } from "vue";
import { useMenu } from "@/composables/useMenu";
const { mobile, identificaDispositivo } = useMenu();
const { flash } = usePage().props;
const { setLoading } = useApp();
onMounted(() => {
    identificaDispositivo();
    console.log(mobile.value);
    setTimeout(() => {
        setLoading(false);
    }, 300);
});
const breadbrums = [
    {
        title: "Inicio",
        disabled: false,
        url: route("inicio"),
        name_url: "inicio",
    },
    {
        title: "Usuarios",
        disabled: false,
        url: route("usuarios.index"),
        name_url: "usuarios.index",
    },
];

const { getUsuariosPaginado } = useUsuarios();

const datosUsuarios = ref([]);
const listUsuarios = ref([]);

const itemsPerPage = ref(5);

const headers = ref([
    {
        title: "Id",
        align: "start",
        sortable: true,
        key: "id",
    },
    { title: "Nombre", key: "full_name", align: "start" },
    { title: "Tipo", key: "tipo", align: "start" },
    { title: "Acción", key: "accion", align: "end" },
]);

const search = ref("");
const loading = ref(true);
const totalItems = ref(0);

const loadItems = async ({ page, itemsPerPage, sortBy }) => {
    datosUsuarios.value = await getUsuariosPaginado({
        page,
        itemsPerPage,
        sortBy,
    });
    listUsuarios.value = datosUsuarios.value.data;
    totalItems.value = parseInt(datosUsuarios.value.total);
    loading.value = false;
};

const options = ref({
    page: 1,
    itemsPerPage: itemsPerPage,
    sortBy: [],
});

const recargaUsuarios = async () => {
    datosUsuarios.value = await getUsuariosPaginado(options.value);
    listUsuarios.value = datosUsuarios.value.data;
    totalItems.value = parseInt(datosUsuarios.value.total);
    loading.value = false;
};

const dialog = ref(false);
const accion = ref(0);

let form = useForm({
    id: 0,
    nombre: "",
    paterno: "",
    materno: "",
    ci: "",
    ci_exp: "",
    dir: "",
    email: "",
    fono: "",
    tipo: "",
    foto: "",
    acceso: 0,
});

const abrirDialog = () => {
    accion.value = 0;
    dialog.value = true;
    form = useForm({
        id: 0,
        nombre: "",
        paterno: "",
        materno: "",
        ci: "",
        ci_exp: "",
        dir: "",
        email: "",
        fono: "",
        tipo: "",
        foto: "",
        acceso: 0,
    });
};

const listTipos = ["ADMINISTRADOR", "AUXILIAR"];
const listExpedido = [
    { value: "LP", label: "La Paz" },
    { value: "CB", label: "Cochabamba" },
    { value: "SC", label: "Santa Cruz" },
    { value: "CH", label: "Chuquisaca" },
    { value: "OR", label: "Oruro" },
    { value: "PT", label: "Potosi" },
    { value: "TJ", label: "Tarija" },
    { value: "PD", label: "Pando" },
    { value: "BN", label: "Beni" },
];

const foto = ref(null);
function cargaArchivo(e, key) {
    form[key] = null;
    form[key] = e.target.files[0];
}

const tituloDialog = computed(() => {
    return accion.value == 0 ? "Agregar Usuario" : "Editar Usuario";
});

const editarUsuario = (item) => {
    accion.value = 1;
    form = useForm({
        id: item.id,
        nombre: item.nombre,
        paterno: item.paterno,
        materno: item.materno,
        ci: item.ci,
        ci_exp: item.ci_exp,
        dir: item.dir,
        email: item.email,
        fono: item.fono,
        tipo: item.tipo,
        foto: item.foto,
        acceso: item.acceso + "",
        _method: "put",
    });
    dialog.value = true;
};

const eliminarUsuario = (item) => {
    Swal.fire({
        title: "¿Quierés eliminar este registro?",
        html: `<strong>${item.full_name}</strong>`,
        showCancelButton: true,
        confirmButtonColor: "#B61431",
        confirmButtonText: "Si, eliminar",
        cancelButtonText: "No, cancelar",
        denyButtonText: `No, cancelar`,
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            axios
                .post(route("usuarios.destroy", item.id), {
                    _method: "DELETE",
                })
                .then((response) => {
                    Swal.fire({
                        icon: "success",
                        title: response.data.message,
                        showConfirmButton: false,
                        timer: 1500,
                    });
                    recargaUsuarios();
                })
                .catch((error) => {
                    if (error.response) {
                        if (error.response.status === 422) {
                            this.errors = error.response.data.errors;
                        }
                        if (
                            error.response.status === 420 ||
                            error.response.status === 419 ||
                            error.response.status === 401
                        ) {
                            window.location = "/";
                        }
                        if (error.response.status === 500) {
                            Swal.fire({
                                icon: "error",
                                title: "Error",
                                html: error.response.data.message,
                                showConfirmButton: false,
                                timer: 2000,
                            });
                        }
                    }
                });
        }
    });
};

const enviarFormulario = () => {
    if (form.id == 0) {
        form.post(route("usuarios.store"), {
            preserveScroll: true,
            forceFormData: true,
            onSuccess: () => {
                form.clearErrors();
                Swal.fire({
                    icon: "success",
                    title: "Correcto",
                    text: `${flash.bien ? flash.bien : "Proceso realizado"}`,
                    confirmButtonColor: "#3085d6",
                    confirmButtonText: `Aceptar`,
                });
                dialog.value = false;
                form.reset();
                recargaUsuarios();
            },
            onError: (err) => {
                Swal.fire({
                    icon: "info",
                    title: "Error",
                    text: `${
                        flash.error
                            ? flash.error
                            : err.error
                            ? err.error
                            : "Hay errores en el formulario"
                    }`,
                    confirmButtonColor: "#3085d6",
                    confirmButtonText: `Aceptar`,
                });
            },
        });
    } else {
        console.log("editar");
        form.post(route("usuarios.update", form.id), {
            preserveScroll: true,
            forceFormData: true,
            onSuccess: () => {
                form.clearErrors();
                Swal.fire({
                    icon: "success",
                    title: "Correcto",
                    text: `${flash.bien ? flash.bien : "Proceso realizado"}`,
                    confirmButtonColor: "#3085d6",
                    confirmButtonText: `Aceptar`,
                });
                dialog.value = false;
                form.reset();
                recargaUsuarios();
            },
            onError: (err) => {
                console.log(err);
                Swal.fire({
                    icon: "info",
                    title: "Error",
                    text: `${
                        flash.error
                            ? flash.error
                            : err.error
                            ? err.error
                            : "Hay errores en el formulario"
                    }`,
                    confirmButtonColor: "#3085d6",
                    confirmButtonText: `Aceptar`,
                });
            },
        });
    }
};

onMounted(() => {});
</script>
<template>
    <v-container>
        <BreadBrums :breadbrums="breadbrums"></BreadBrums>
        <v-row>
            <v-col cols="12" class="d-flex justify-end">
                <v-btn
                    color="blue"
                    prepend-icon="mdi-plus"
                    @click="abrirDialog"
                >
                    Agregar</v-btn
                >
            </v-col>
        </v-row>
        <v-row>
            <v-col cols="12">
                <v-card flat>
                    <v-card-title> Usuarios </v-card-title>
                    <v-card-text>
                        <v-row>
                            <v-col cols="12" md="4" offset-md="8">
                                <v-text-field
                                    v-model="search"
                                    label="Buscar"
                                    prepend-inner-icon="mdi-magnify"
                                    single-line
                                    variant="outlined"
                                    color="blue"
                                    hide-details
                                ></v-text-field>
                            </v-col>
                        </v-row>
                        <v-data-table-server
                            v-model:items-per-page="itemsPerPage"
                            :headers="!mobile ? headers : []"
                            :class="[mobile ? 'mobile' : '']"
                            :items-length="totalItems"
                            :items="listUsuarios"
                            :loading="loading"
                            :search="search"
                            @update:options="loadItems"
                            height="auto"
                        >
                            <template v-slot:item="{ item }">
                                <tr v-if="!mobile">
                                    <td>{{ item.id }}</td>
                                    <td class="text-xs-right">
                                        {{ item.full_name }}
                                    </td>
                                    <td class="text-xs-right">
                                        {{ item.tipo }}
                                    </td>
                                    <td>
                                        <v-btn
                                            color="yellow"
                                            size="sm"
                                            class="pa-1 ma-1"
                                            @click="editarUsuario(item)"
                                            ><v-icon>mdi-pencil</v-icon></v-btn
                                        >
                                        <v-btn
                                            color="error"
                                            size="sm"
                                            class="pa-1 ma-1"
                                            @click="eliminarUsuario(item)"
                                            ><v-icon
                                                >mdi-trash-can</v-icon
                                            ></v-btn
                                        >
                                    </td>
                                </tr>
                                <tr v-else>
                                    <td>
                                        <ul class="flex-content">
                                            <li
                                                class="flex-item"
                                                data-label="Id"
                                            >
                                                {{ item.id }}
                                            </li>
                                            <li
                                                class="flex-item"
                                                data-label="Nombre"
                                            >
                                                {{ item.full_name }}
                                            </li>
                                            <li
                                                class="flex-item"
                                                data-label="Tipo"
                                            >
                                                {{ item.tipo }}
                                            </li>
                                            <li
                                                class="flex-item"
                                                data-label="Tipo"
                                            >
                                                {{ item.tipo }}
                                            </li>
                                        </ul>
                                        <!-- <v-row>
                                            <v-col cols="12">
                                                <v-btn
                                                    color="yellow"
                                                    size="sm"
                                                    class="pa-1 ma-1"
                                                    @click="editarUsuario(item)"
                                                    ><v-icon
                                                        >mdi-pencil</v-icon
                                                    ></v-btn
                                                >
                                                <v-btn
                                                    color="error"
                                                    size="sm"
                                                    class="pa-1 ma-1"
                                                    @click="
                                                        eliminarUsuario(item)
                                                    "
                                                    ><v-icon
                                                        >mdi-trash-can</v-icon
                                                    ></v-btn
                                                >
                                            </v-col>
                                        </v-row> -->
                                    </td>
                                </tr>
                            </template>
                        </v-data-table-server>
                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>
        <v-row justify="center">
            <v-dialog v-model="dialog" persistent width="1024" scrollable>
                <v-card>
                    <v-card-title class="border-b bg-blue">
                        <span class="text-h5" v-html="tituloDialog"></span>
                    </v-card-title>
                    <v-card-text>
                        <v-container>
                            <form>
                                <v-row>
                                    <v-col cols="12" sm="6" md="4">
                                        <v-text-field
                                            :class="
                                                form.errors?.nombre
                                                    ? 'mb-3'
                                                    : ''
                                            "
                                            :error="
                                                form.errors?.nombre
                                                    ? true
                                                    : false
                                            "
                                            :error-messages="
                                                form.errors?.nombre
                                                    ? form.errors?.nombre
                                                    : ''
                                            "
                                            variant="outlined"
                                            label="Nombre*"
                                            required
                                            v-model="form.nombre"
                                        ></v-text-field>
                                    </v-col>
                                    <v-col cols="12" sm="6" md="4">
                                        <v-text-field
                                            :class="
                                                form.errors?.paterno
                                                    ? 'mb-3'
                                                    : ''
                                            "
                                            :error="
                                                form.errors?.paterno
                                                    ? true
                                                    : false
                                            "
                                            :error-messages="
                                                form.errors?.paterno
                                                    ? form.errors?.paterno
                                                    : ''
                                            "
                                            variant="outlined"
                                            label="Apellido Paterno*"
                                            v-model="form.paterno"
                                            required
                                        ></v-text-field>
                                    </v-col>
                                    <v-col cols="12" sm="6" md="4">
                                        <v-text-field
                                            :class="
                                                form.errors?.materno
                                                    ? 'mb-3'
                                                    : ''
                                            "
                                            :error="
                                                form.errors?.materno
                                                    ? true
                                                    : false
                                            "
                                            :error-messages="
                                                form.errors?.materno
                                                    ? form.errors?.materno
                                                    : ''
                                            "
                                            variant="outlined"
                                            label="Apellido Materno"
                                            v-model="form.materno"
                                            required
                                        ></v-text-field>
                                    </v-col>
                                    <v-col cols="12" sm="6" md="4">
                                        <v-text-field
                                            :class="
                                                form.errors?.ci ? 'mb-3' : ''
                                            "
                                            :error="
                                                form.errors?.ci ? true : false
                                            "
                                            :error-messages="
                                                form.errors?.ci
                                                    ? form.errors?.ci
                                                    : ''
                                            "
                                            variant="outlined"
                                            label="C.I.*"
                                            v-model="form.ci"
                                            required
                                        ></v-text-field>
                                    </v-col>
                                    <v-col cols="12" sm="6" md="4">
                                        <v-select
                                            :class="
                                                form.errors?.ci_exp
                                                    ? 'mb-3'
                                                    : ''
                                            "
                                            :error="
                                                form.errors?.ci_exp
                                                    ? true
                                                    : false
                                            "
                                            :error-messages="
                                                form.errors?.ci_exp
                                                    ? form.errors?.ci_exp
                                                    : ''
                                            "
                                            variant="outlined"
                                            clearable
                                            :items="listExpedido"
                                            item-value="value"
                                            item-title="label"
                                            label="Expedido*"
                                            v-model="form.ci_exp"
                                            required
                                        ></v-select>
                                    </v-col>
                                    <v-col cols="12" sm="6" md="4">
                                        <v-text-field
                                            :class="
                                                form.errors?.dir ? 'mb-3' : ''
                                            "
                                            :error="
                                                form.errors?.dir ? true : false
                                            "
                                            :error-messages="
                                                form.errors?.dir
                                                    ? form.errors?.dir
                                                    : ''
                                            "
                                            variant="outlined"
                                            label="Dirección*"
                                            v-model="form.dir"
                                            required
                                        ></v-text-field>
                                    </v-col>
                                    <v-col cols="12" sm="6" md="4">
                                        <v-text-field
                                            :class="
                                                form.errors?.correo
                                                    ? 'mb-3'
                                                    : ''
                                            "
                                            :error="
                                                form.errors?.correo
                                                    ? true
                                                    : false
                                            "
                                            :error-messages="
                                                form.errors?.correo
                                                    ? form.errors?.correo
                                                    : ''
                                            "
                                            variant="outlined"
                                            label="Correo"
                                            v-model="form.correo"
                                            required
                                        ></v-text-field>
                                    </v-col>
                                    <v-col cols="12" sm="6" md="4">
                                        <v-text-field
                                            :class="
                                                form.errors?.fono ? 'mb-3' : ''
                                            "
                                            :error="
                                                form.errors?.fono ? true : false
                                            "
                                            :error-messages="
                                                form.errors?.fono
                                                    ? form.errors?.fono
                                                    : ''
                                            "
                                            variant="outlined"
                                            label="Teléfono/Celular"
                                            v-model="form.fono"
                                            required
                                        ></v-text-field>
                                    </v-col>
                                    <v-col cols="12" sm="6" md="4">
                                        <v-select
                                            :class="
                                                form.errors?.tipo ? 'mb-3' : ''
                                            "
                                            :error="
                                                form.errors?.tipo ? true : false
                                            "
                                            :error-messages="
                                                form.errors?.tipo
                                                    ? form.errors?.tipo
                                                    : ''
                                            "
                                            variant="outlined"
                                            clearable
                                            :items="listTipos"
                                            label="Tipo de Usuario*"
                                            v-model="form.tipo"
                                            required
                                        ></v-select>
                                    </v-col>
                                    <v-col cols="12" sm="6" md="4">
                                        <v-file-input
                                            :class="
                                                form.errors?.foto ? 'mb-3' : ''
                                            "
                                            :error="
                                                form.errors?.foto ? true : false
                                            "
                                            :error-messages="
                                                form.errors?.foto
                                                    ? form.errors?.foto
                                                    : ''
                                            "
                                            density="compact"
                                            variant="outlined"
                                            accept="image/png, image/jpeg, image/bmp"
                                            placeholder="Foto"
                                            prepend-icon="mdi-camera"
                                            label="Foto"
                                            @change="
                                                cargaArchivo($event, 'foto')
                                            "
                                            ref="foto"
                                        ></v-file-input>
                                    </v-col>
                                    <v-col cols="12" sm="6" md="4">
                                        <v-switch
                                            color="success"
                                            true-value="1"
                                            false-value="0"
                                            v-model="form.acceso"
                                            :label="`${
                                                form.acceso == '1'
                                                    ? 'Permitido'
                                                    : 'Denegado'
                                            }`"
                                        ></v-switch>
                                    </v-col>
                                </v-row>
                            </form>
                        </v-container>
                    </v-card-text>
                    <v-card-actions class="border-t">
                        <v-spacer></v-spacer>
                        <v-btn
                            color="blue-darken-1"
                            variant="text"
                            @click="dialog = false"
                        >
                            Cancelar
                        </v-btn>
                        <v-btn
                            class="bg-blue"
                            prepend-icon="mdi-content-save"
                            @click="enviarFormulario"
                        >
                            Guardar
                        </v-btn>
                    </v-card-actions>
                </v-card>
            </v-dialog>
        </v-row>
    </v-container>
</template>
