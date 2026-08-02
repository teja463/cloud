{{- define "mychart.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}-configmap
{{- end }}

{{- define "mychart.labels" -}}
app: Sampleapp
version: "10.0.4"
{{- end }}