module servers.togaf.controllers.actions.gbbs.update;

@safe:
import servers.togaf;

class DTGFGbbUpdateActionController : DMVCActionController {
  mixin(MVCControllerThis!("TGFGbbUpdateActionController"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCControllerCalls!("TGFGbbUpdateActionController", "DTGFGbbUpdateActionController"));
