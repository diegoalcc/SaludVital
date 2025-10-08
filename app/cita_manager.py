from datetime import datetime

class CitaManager:
    def __init__(self):
        self.citas = []

    def agendar_cita(self, paciente, medico, fecha):
        if self._cita_existente(paciente, medico, fecha):
            raise ValueError("Cita duplicada.")
        self.citas.append({
            "paciente": paciente,
            "medico": medico,
            "fecha": fecha,
            "registrado": datetime.now().isoformat()
        })
        return True

    def _cita_existente(self, paciente, medico, fecha):
        return any(cita for cita in self.citas if cita["paciente"] == paciente and cita["fecha"] == fecha)
