# src/mission_router.py
class MissionRouter:
    def route(self, input_signal):
        if "fire" in input_signal.lower():
            return "EcoGuardian"
        if "conflict" in input_signal.lower():
            return "Peacekeeper"
        return "GeneralAgent"
