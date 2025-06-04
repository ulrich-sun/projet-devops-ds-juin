{{- define "icgroup.labels" -}}
app: {{ . }}
{{- end }}

{{- define "icgroup.selectorLabels" -}}
app: {{ . }}
{{- end }}