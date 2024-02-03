<script setup>
// componentes
import BreadBrums from "@/Components/BreadBrums.vue";
import { ref, onMounted, reactive } from "vue";
import { useForm } from "@inertiajs/vue3";
import { useInstitucion } from "@/composables/useInstitucion";
import { useApp } from "@/composables/useApp";
const { setLoading } = useApp();
onMounted(() => {
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
        title: "Institución",
        disabled: false,
        url: route("institucions.index"),
        name_url: "institucions.index",
    },
];

const props = defineProps({
    institucion: {
        type: Object,
    },
});

const institucion = ref(props.institucion);
const window = ref(0);

const cambiaVentana = (val) => {
    window.value = val;
};

institucion.value["_method"] = "put";

let form = useForm(institucion.value);

const enviaFormulario = () => {
    form.post(route("institucions.update", institucion.value.id));
    setTimeout(() => {
        obtnerInstitucion();
        cambiaVentana(0);
    }, 300);
};

const { getInstitucion } = useInstitucion();

const obtnerInstitucion = async () => {
    try {
        institucion.value = await getInstitucion(institucion.id);
        institucion.value["_method"] = "put";
        form = useForm(institucion.value);
        limpiaRefs();
    } catch (error) {
        console.error(error);
    }
};

function cargaArchivo(e, key) {
    form[key] = null;
    form[key] = e.target.files[0];
}

const foto_director = ref(null);
const foto_subdirector = ref(null);
const logo = ref(null);
const img_organigrama = ref(null);

function limpiaRefs() {
    foto_director.value.reset();
    foto_subdirector.value.reset();
    logo.value.reset();
    img_organigrama.value.reset();
}
</script>
<template>
    <v-container>
        <BreadBrums :breadbrums="breadbrums"></BreadBrums>
        <v-row>
            <v-col cols="12" class="d-flex justify-end">
                <v-btn
                    prepend-icon="mdi-pencil"
                    color="blue"
                    v-if="window == 0"
                    @click="cambiaVentana(1)"
                >
                    Editar</v-btn
                >
                <v-btn
                    prepend-icon="mdi-close"
                    class="mr-2"
                    v-if="window == 1"
                    @click="cambiaVentana(0)"
                >
                    Cancelar</v-btn
                >
                <v-btn
                    prepend-icon="mdi-content-save"
                    color="blue"
                    v-if="window == 1"
                    @click="enviaFormulario"
                >
                    Guardar</v-btn
                >
            </v-col>
        </v-row>
        <v-row>
            <v-col cols="12">
                <v-window v-model="window">
                    <v-window-item :key="0">
                        <v-row>
                            <v-col cols="12" sm="4">
                                <v-card>
                                    <v-card-text>
                                        <v-row>
                                            <v-col
                                                cols="12"
                                                class="text-center"
                                            >
                                                <v-img
                                                    cover
                                                    v-if="institucion.url_logo"
                                                    :src="institucion.url_logo"
                                                    class="w-75 mx-auto"
                                                ></v-img>
                                                <v-avatar
                                                    v-else
                                                    color="blue"
                                                    size="100"
                                                >
                                                    <span
                                                        class="text-h5"
                                                        v-text="
                                                            institucion.iniciales_nombre
                                                        "
                                                    ></span>
                                                </v-avatar>
                                                <span
                                                    class="text-h5 d-block mt-3"
                                                    >{{
                                                        institucion.nombre
                                                    }}</span
                                                >
                                            </v-col>
                                        </v-row>
                                        <v-row class="px-3">
                                            <v-col cols="12">
                                                <v-row>
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                        class="text-right"
                                                        >Nombre Sistema:</v-col
                                                    >
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="8"
                                                        class="text-left"
                                                        >{{
                                                            institucion.nombre_sistema
                                                        }}</v-col
                                                    >
                                                </v-row>
                                                <v-row>
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                        class="text-right"
                                                        >Nit:</v-col
                                                    >
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="8"
                                                        class="text-left"
                                                        >{{
                                                            institucion.nit
                                                        }}</v-col
                                                    >
                                                </v-row>
                                                <v-row>
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                        class="text-right d-flex justify-end align-center"
                                                        >Director:</v-col
                                                    >
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="8"
                                                        class="text-left d-flex align-center"
                                                    >
                                                        {{
                                                            institucion.nombre_director
                                                        }}
                                                        <v-avatar
                                                            class="ml-2"
                                                            :color="
                                                                institucion.url_foto_director
                                                                    ? 'grey'
                                                                    : 'blue'
                                                            "
                                                            size="40"
                                                        >
                                                            <v-img
                                                                cover
                                                                v-if="
                                                                    institucion.url_foto_director
                                                                "
                                                                :src="
                                                                    institucion.url_foto_director
                                                                "
                                                            ></v-img>
                                                            <span
                                                                v-else
                                                                class=""
                                                            >
                                                                {{
                                                                    institucion.iniciales_director
                                                                }}
                                                            </span>
                                                        </v-avatar></v-col
                                                    >
                                                </v-row>
                                                <v-row>
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                        class="text-right d-flex justify-end align-center"
                                                        >Subdirector:</v-col
                                                    >
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="8"
                                                        class="text-left d-flex align-center"
                                                    >
                                                        {{
                                                            institucion.nombre_subdirector
                                                        }}
                                                        <v-avatar
                                                            class="ml-2"
                                                            :color="
                                                                institucion.url_foto_subdirector
                                                                    ? 'grey'
                                                                    : 'blue'
                                                            "
                                                            size="40"
                                                            v-if="
                                                                institucion.nombre_subdirector
                                                            "
                                                        >
                                                            <v-img
                                                                cover
                                                                v-if="
                                                                    institucion.url_foto_subdirector
                                                                "
                                                                :src="
                                                                    institucion.url_foto_subdirector
                                                                "
                                                            ></v-img>
                                                            <span
                                                                v-else
                                                                class=""
                                                            >
                                                                {{
                                                                    institucion.iniciales_subdirector
                                                                }}
                                                            </span>
                                                        </v-avatar></v-col
                                                    >
                                                </v-row>
                                                <v-row>
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                        class="text-right"
                                                        >Teléfono 1:</v-col
                                                    >
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="8"
                                                        class="text-left"
                                                        >{{
                                                            institucion.fono1
                                                        }}</v-col
                                                    >
                                                </v-row>
                                                <v-row>
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                        class="text-right"
                                                        >Teléfono 2:</v-col
                                                    >
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="8"
                                                        class="text-left"
                                                        >{{
                                                            institucion.fono2
                                                        }}</v-col
                                                    >
                                                </v-row>
                                                <v-row>
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                        class="text-right"
                                                        >Correo 1:</v-col
                                                    >
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="8"
                                                        class="text-left"
                                                        >{{
                                                            institucion.correo1
                                                        }}</v-col
                                                    >
                                                </v-row>
                                                <v-row>
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                        class="text-right"
                                                        >Correo 2:</v-col
                                                    >
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="8"
                                                        class="text-left"
                                                        >{{
                                                            institucion.correo2
                                                        }}</v-col
                                                    >
                                                </v-row>
                                                <v-row>
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                        class="text-right"
                                                        >Facebook:</v-col
                                                    >
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="8"
                                                        class="text-left"
                                                        >{{
                                                            institucion.facebook
                                                        }}</v-col
                                                    >
                                                </v-row>
                                                <v-row>
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                        class="text-right"
                                                        >Youtube:</v-col
                                                    >
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="8"
                                                        class="text-left"
                                                        >{{
                                                            institucion.youtube
                                                        }}</v-col
                                                    >
                                                </v-row>
                                                <v-row>
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                        class="text-right"
                                                        >Twitter:</v-col
                                                    >
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="8"
                                                        class="text-left"
                                                        >{{
                                                            institucion.twitter
                                                        }}</v-col
                                                    >
                                                </v-row>
                                                <v-row>
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                        class="text-right"
                                                        >Dirección:</v-col
                                                    >
                                                    <v-col
                                                        cols="6"
                                                        sm="6"
                                                        md="6"
                                                        xl="8"
                                                        class="text-left"
                                                        >{{
                                                            institucion.dir
                                                        }}</v-col
                                                    >
                                                </v-row>
                                            </v-col>
                                        </v-row>
                                    </v-card-text>
                                </v-card>
                            </v-col>
                            <v-col cols="12" sm="8">
                                <v-card>
                                    <v-card-text>
                                        <v-row>
                                            <v-col
                                                cols="12"
                                                sm="6"
                                                class="text-center"
                                            >
                                                <span class="text-h6"
                                                    >ORGANIGRAMA</span
                                                >
                                                <br />
                                                <v-img
                                                    cover
                                                    v-if="
                                                        institucion.url_img_organigrama
                                                    "
                                                    :src="
                                                        institucion.url_img_organigrama
                                                    "
                                                ></v-img>
                                            </v-col>
                                            <v-col
                                                cols="12"
                                                sm="6"
                                                class="text-center"
                                            >
                                                <span class="text-h6"
                                                    >HISTORIA</span
                                                >
                                                <br />
                                                <p
                                                    v-text="
                                                        institucion.historia
                                                    "
                                                ></p>
                                            </v-col>
                                            <v-col
                                                cols="12"
                                                sm="6"
                                                class="text-center"
                                            >
                                                <span class="text-h6"
                                                    >MISIÓN</span
                                                >
                                                <br />
                                                <p
                                                    v-text="institucion.mision"
                                                ></p>
                                            </v-col>
                                            <v-col
                                                cols="12"
                                                sm="6"
                                                class="text-center"
                                            >
                                                <span class="text-h6"
                                                    >OBJETIVO GENERAL</span
                                                >
                                                <br />
                                                <p
                                                    v-text="
                                                        institucion.objetivo
                                                    "
                                                ></p>
                                            </v-col>
                                        </v-row>
                                    </v-card-text>
                                </v-card>
                            </v-col>
                            <v-col cols="12">
                                <v-card>
                                    <v-card-text>
                                        <v-row>
                                            <v-col cols="12">
                                                <span
                                                    class="d-block text-h5 text-center"
                                                    >Ubicación Google Maps</span
                                                >
                                            </v-col>
                                            <v-col
                                                cols="12"
                                                v-html="
                                                    institucion.ubicacion_google
                                                "
                                            ></v-col>
                                        </v-row>
                                    </v-card-text>
                                </v-card>
                            </v-col>
                        </v-row>
                    </v-window-item>
                    <v-window-item :key="1">
                        <v-row>
                            <v-col cols="12">
                                <v-card>
                                    <v-card-title
                                        >Modificar información</v-card-title
                                    >
                                    <v-card-text>
                                        <v-container>
                                            <form @submit="enviaFormulario">
                                                <v-row>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-text-field
                                                            density="compact"
                                                            variant="outlined"
                                                            color="blue"
                                                            label="Nombre Institución*"
                                                            v-model="
                                                                form.nombre
                                                            "
                                                            required
                                                        ></v-text-field>
                                                    </v-col>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-text-field
                                                            density="compact"
                                                            variant="outlined"
                                                            color="blue"
                                                            label="Nombre Sistema*"
                                                            v-model="
                                                                form.nombre_sistema
                                                            "
                                                            required
                                                        ></v-text-field>
                                                    </v-col>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-text-field
                                                            density="compact"
                                                            variant="outlined"
                                                            color="blue"
                                                            label="Nit*"
                                                            v-model="form.nit"
                                                            required
                                                        ></v-text-field>
                                                    </v-col>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-text-field
                                                            density="compact"
                                                            variant="outlined"
                                                            color="blue"
                                                            label="Nombre Completo Director*"
                                                            v-model="
                                                                form.nombre_director
                                                            "
                                                            required
                                                        ></v-text-field>
                                                    </v-col>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-file-input
                                                            density="compact"
                                                            variant="outlined"
                                                            accept="image/png, image/jpeg, image/bmp"
                                                            placeholder="Foto Director"
                                                            prepend-icon="mdi-camera"
                                                            label="Foto Director"
                                                            @change="
                                                                cargaArchivo(
                                                                    $event,
                                                                    'foto_director'
                                                                )
                                                            "
                                                            ref="foto_director"
                                                        ></v-file-input>
                                                    </v-col>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-text-field
                                                            density="compact"
                                                            variant="outlined"
                                                            color="blue"
                                                            label="Nombre Completo Subirector"
                                                            v-model="
                                                                form.nombre_subdirector
                                                            "
                                                            required
                                                        ></v-text-field>
                                                    </v-col>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-file-input
                                                            density="compact"
                                                            variant="outlined"
                                                            accept="image/png, image/jpeg, image/bmp"
                                                            placeholder="Foto Subdirector"
                                                            prepend-icon="mdi-camera"
                                                            label="Foto Subdirector"
                                                            @change="
                                                                cargaArchivo(
                                                                    $event,
                                                                    'foto_subdirector'
                                                                )
                                                            "
                                                            ref="foto_subdirector"
                                                        ></v-file-input>
                                                    </v-col>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-text-field
                                                            density="compact"
                                                            variant="outlined"
                                                            color="blue"
                                                            label="Teléfono 1"
                                                            v-model="form.fono1"
                                                            required
                                                        ></v-text-field>
                                                    </v-col>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-text-field
                                                            density="compact"
                                                            variant="outlined"
                                                            color="blue"
                                                            label="Teléfono 2"
                                                            v-model="form.fono2"
                                                            required
                                                        ></v-text-field>
                                                    </v-col>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-text-field
                                                            density="compact"
                                                            variant="outlined"
                                                            color="blue"
                                                            label="Correo 1"
                                                            v-model="
                                                                form.correo1
                                                            "
                                                            required
                                                        ></v-text-field>
                                                    </v-col>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-text-field
                                                            density="compact"
                                                            variant="outlined"
                                                            color="blue"
                                                            label="Correo 2"
                                                            v-model="
                                                                form.correo2
                                                            "
                                                            required
                                                        ></v-text-field>
                                                    </v-col>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-text-field
                                                            density="compact"
                                                            variant="outlined"
                                                            color="blue"
                                                            label="Facebook"
                                                            v-model="
                                                                form.facebook
                                                            "
                                                            required
                                                        ></v-text-field>
                                                    </v-col>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-text-field
                                                            density="compact"
                                                            variant="outlined"
                                                            color="blue"
                                                            label="Youtube"
                                                            v-model="
                                                                form.youtube
                                                            "
                                                            required
                                                        ></v-text-field>
                                                    </v-col>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-text-field
                                                            density="compact"
                                                            variant="outlined"
                                                            color="blue"
                                                            label="Twitter"
                                                            v-model="
                                                                form.twitter
                                                            "
                                                            required
                                                        ></v-text-field>
                                                    </v-col>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-text-field
                                                            density="compact"
                                                            variant="outlined"
                                                            color="blue"
                                                            label="Dirección"
                                                            v-model="form.dir"
                                                            required
                                                        ></v-text-field>
                                                    </v-col>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-file-input
                                                            density="compact"
                                                            variant="outlined"
                                                            accept="image/png, image/jpeg, image/bmp"
                                                            placeholder="Logo"
                                                            prepend-icon="mdi-camera"
                                                            label="Logo"
                                                            @change="
                                                                cargaArchivo(
                                                                    $event,
                                                                    'logo'
                                                                )
                                                            "
                                                            ref="logo"
                                                        ></v-file-input>
                                                    </v-col>
                                                    <v-col
                                                        cols="12"
                                                        sm="6"
                                                        md="6"
                                                        xl="4"
                                                    >
                                                        <v-file-input
                                                            density="compact"
                                                            variant="outlined"
                                                            accept="image/png, image/jpeg, image/bmp"
                                                            placeholder="Organigrama"
                                                            prepend-icon="mdi-camera"
                                                            label="Organigrama"
                                                            @change="
                                                                cargaArchivo(
                                                                    $event,
                                                                    'img_organigrama'
                                                                )
                                                            "
                                                            ref="img_organigrama"
                                                        ></v-file-input>
                                                    </v-col>
                                                </v-row>
                                                <v-row>
                                                    <v-col cols="12">
                                                        <v-textarea
                                                            variant="outlined"
                                                            label="Historia"
                                                            rows="1"
                                                            auto-grow
                                                            v-model="
                                                                form.historia
                                                            "
                                                        ></v-textarea>
                                                    </v-col>
                                                    <v-col cols="12">
                                                        <v-textarea
                                                            variant="outlined"
                                                            label="Misión"
                                                            rows="1"
                                                            auto-grow
                                                            v-model="
                                                                form.mision
                                                            "
                                                        ></v-textarea>
                                                    </v-col>
                                                    <v-col cols="12">
                                                        <v-textarea
                                                            variant="outlined"
                                                            label="Objetivo General"
                                                            rows="1"
                                                            auto-grow
                                                            v-model="
                                                                form.objetivo
                                                            "
                                                        ></v-textarea>
                                                    </v-col>
                                                    <v-col cols="12">
                                                        <v-textarea
                                                            variant="outlined"
                                                            label="Ubicación Google Maps"
                                                            rows="1"
                                                            auto-grow
                                                            v-model="
                                                                form.ubicacion_google
                                                            "
                                                        ></v-textarea>
                                                    </v-col>
                                                </v-row>
                                            </form>
                                        </v-container>
                                    </v-card-text>
                                </v-card>
                            </v-col>
                        </v-row>
                    </v-window-item>
                </v-window>
            </v-col>
        </v-row>
    </v-container>
</template>
