import DiffractionScatteringTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ScatteringSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ScatteringAdmittedObject where
  space : ScatteringSpace
  incidentWave : Prop
  scatterer : Prop
  farFieldPattern : Type
  farFieldTopology : TopologicalSpace farFieldPattern
  patternIsMeasurable : Prop
  conclusion : patternIsMeasurable

structure ScatteringEndgameState where
  object : ScatteringAdmittedObject

def ScatteringWitnessClosed (O : ScatteringAdmittedObject) : Prop :=
  O.patternIsMeasurable

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse