import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'paginaprincipal_model.dart';
export 'paginaprincipal_model.dart';

class PaginaprincipalWidget extends StatefulWidget {
  const PaginaprincipalWidget({super.key});

  static String routeName = 'PAGINAPRINCIPAL';
  static String routePath = '/paginaprincipal';

  @override
  State<PaginaprincipalWidget> createState() => _PaginaprincipalWidgetState();
}

class _PaginaprincipalWidgetState extends State<PaginaprincipalWidget> {
  late PaginaprincipalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaprincipalModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          title: Text(
            'AgroManager',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0x33FFFFFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      FutureBuilder<List<UsuariosRow>>(
                        future: UsuariosTable().querySingleRow(
                          queryFn: (q) => q.eqOrNull(
                            'id_usuario',
                            FFAppState().idUsuarioYo,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<UsuariosRow> textUsuariosRowList =
                              snapshot.data!;

                          final textUsuariosRow = textUsuariosRowList.isNotEmpty
                              ? textUsuariosRowList.first
                              : null;

                          return Text(
                            valueOrDefault<String>(
                              textUsuariosRow?.nombre,
                              'Mi Nombre',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          );
                        },
                      ),
                    ].divide(SizedBox(width: 8)),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 230, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(LoginShirleyWidget.routeName);

                            FFAppState().idUsuarioYo = 0;
                            FFAppState().miRolYo = '';
                            safeSetState(() {});
                          },
                          text: 'Cerrar SesiÃ³n',
                          options: FFButtonOptions(
                            height: 40,
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: Colors.green,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Text(
                        'Panel de Control AgrÃ­cola',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              font: GoogleFonts.interTight(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                              color: Colors.green,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
                            ),
                      ),
                      GridView(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.7,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          if (FFAppState().miRolYo == 'Administrador')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(Cu001Widget.routeName);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8,
                                      color: Color(0x1A4CAF50),
                                      offset: Offset(
                                        0,
                                        4,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Icon(
                                            Icons.inventory_2_rounded,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Gestionar Inventario de Insumos',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 12)),
                                  ),
                                ),
                              ),
                            ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(CU002OwenVegaWidget.routeName);
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8,
                                    color: Color(0x1A4CAF50),
                                    offset: Offset(
                                      0,
                                      4,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Icon(
                                          Icons.agriculture_rounded,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Registrar Uso de Insumos en Parcela',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 12)),
                                ),
                              ),
                            ),
                          ),
                          if (FFAppState().miRolYo == 'Administrador')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(Caso3jeanWidget.routeName);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8,
                                      color: Color(0x1A4CAF50),
                                      offset: Offset(
                                        0,
                                        4,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Icon(
                                            Icons.warning_rounded,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'GestiÃ³n de Alertas de Bajo Stock',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 12)),
                                  ),
                                ),
                              ),
                            ),
                          if (FFAppState().miRolYo == 'Administrador')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(CU004PieroWidget.routeName);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8,
                                      color: Color(0x1A4CAF50),
                                      offset: Offset(
                                        0,
                                        4,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Icon(
                                            Icons.assessment_rounded,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Generar Reportes de Inventario',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 12)),
                                  ),
                                ),
                              ),
                            ),
                          if (FFAppState().miRolYo == 'Administrador')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(CU005PieroWidget.routeName);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8,
                                      color: Color(0x1A4CAF50),
                                      offset: Offset(
                                        0,
                                        4,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Icon(
                                            Icons.add_location_rounded,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Registrar Nueva Parcela',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 12)),
                                  ),
                                ),
                              ),
                            ),
                          if (FFAppState().miRolYo == 'Administrador')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(Caso6jeanWidget.routeName);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8,
                                      color: Color(0x1A4CAF50),
                                      offset: Offset(
                                        0,
                                        4,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Icon(
                                            Icons.report_problem_rounded,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Registrar PÃ©rdida de Insumos',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 12)),
                                  ),
                                ),
                              ),
                            ),
                          if (FFAppState().miRolYo == 'Administrador')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                    CU007ShirleyAlfaroWidget.routeName);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8,
                                      color: Color(0x1A4CAF50),
                                      offset: Offset(
                                        0,
                                        4,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Icon(
                                            Icons.history_rounded,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Consultar Historial de Movimientos',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 12)),
                                  ),
                                ),
                              ),
                            ),
                          if (FFAppState().miRolYo == 'Administrador')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(CU008JulioWidget.routeName);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8,
                                      color: Color(0x1A4CAF50),
                                      offset: Offset(
                                        0,
                                        4,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Icon(
                                            Icons.bar_chart_rounded,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Generar Reporte de Consumo',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 12)),
                                  ),
                                ),
                              ),
                            ),
                          if (FFAppState().miRolYo == 'Administrador')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(Cu009julioWidget.routeName);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8,
                                      color: Color(0x1A4CAF50),
                                      offset: Offset(
                                        0,
                                        4,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Icon(
                                            Icons.add_circle_rounded,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Registrar Nuevos Insumos',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 12)),
                                  ),
                                ),
                              ),
                            ),
                          if (FFAppState().miRolYo == 'Administrador')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context
                                    .pushNamed(CU010OwenVegaWidget.routeName);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8,
                                      color: Color(0x1A4CAF50),
                                      offset: Offset(
                                        0,
                                        4,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Icon(
                                            Icons.event_available_rounded,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Visualizar Fechas de Vencimiento',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 12)),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ]
                        .divide(SizedBox(height: 16))
                        .addToStart(SizedBox(height: 24))
                        .addToEnd(SizedBox(height: 24)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
