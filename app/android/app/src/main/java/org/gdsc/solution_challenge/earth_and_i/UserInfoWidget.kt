package org.gdsc.solution_challenge.earth_and_i

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.graphics.Color
import android.util.TypedValue
import android.widget.LinearLayout
import android.widget.RemoteViews

import es.antonborri.home_widget.HomeWidgetPlugin
import kotlin.math.round
import kotlin.math.roundToInt

class UserInfoWidget : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            val widgetData = HomeWidgetPlugin.getData(context)

            val characterAsset: String = widgetData.getString("character_asset", "1_1_1_1")!!
            val positiveDeltaCO2: Int = widgetData.getInt("positive_delta_CO2", 0)
            val negativeDeltaCO2: Int = widgetData.getInt("negative_delta_CO2", 0)

            val views = RemoteViews(context.packageName, R.layout.user_info_widget).apply {
                setViewVisibility(R.id.zero_bar, LinearLayout.VISIBLE)
                setViewVisibility(R.id.delta_CO2_progress_bar, LinearLayout.GONE)

                // Bar Setting
                if (positiveDeltaCO2 != 0 || negativeDeltaCO2 != 0) {
                    setViewVisibility(R.id.zero_bar, LinearLayout.GONE)
                    setViewVisibility(R.id.delta_CO2_progress_bar, LinearLayout.VISIBLE)

                    val negativeDeltaCO2BarRadio: Float = negativeDeltaCO2.toFloat() / (positiveDeltaCO2.toFloat() + negativeDeltaCO2.toFloat())

                    val negativeDeltaCO2BarWidth: Int = round(negativeDeltaCO2BarRadio * 100).roundToInt()

                    setProgressBar(R.id.delta_CO2_progress_bar, 100, negativeDeltaCO2BarWidth, false)
                }

                // Negative Delta CO2 Text Setting
                if (negativeDeltaCO2 == 0) {
                    setTextColor(R.id.negative_delta_CO2_text, Color.parseColor("#ACADB2"))
                    setTextViewText(R.id.negative_delta_CO2_text, "0.0000")
                } else {
                    setTextColor(R.id.negative_delta_CO2_text, Color.parseColor("#F2ABAB"))
                    setTextViewText(R.id.negative_delta_CO2_text, String.format("↑  %.4f", negativeDeltaCO2 / 10000.0f))
                }

                // Positive Delta CO2 Text Setting
                if (positiveDeltaCO2 == 0) {
                    setTextColor(R.id.positive_delta_CO2_text, Color.parseColor("#ACADB2"))
                    setTextViewText(R.id.positive_delta_CO2_text, "0.0000")
                } else {
                    setTextColor(R.id.positive_delta_CO2_text, Color.parseColor("#90CDBE"))
                    setTextViewText(R.id.positive_delta_CO2_text, String.format("↓ %.4f", positiveDeltaCO2 / 10000.0f))
                }

                // Character Layout Setting
                setImageViewResource(
                    R.id.character_asset,
                    stringToDrawableResForSvg(characterAsset!!)
                )
            }

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }


    override fun onEnabled(context: Context) {
        // Enter relevant functionality for when the first widget is created
    }

    override fun onDisabled(context: Context) {
        // Enter relevant functionality for when the last widget is disabled
    }

    private fun stringToDrawableResForSvg(characterAsset: String): Int {
        return when (characterAsset) {
            "1_1_1_1" -> R.drawable.character_1_1_1_1
            "1_1_1_2" -> R.drawable.character_1_1_1_2
            "1_1_2_1" -> R.drawable.character_1_1_2_1
            "1_1_2_2" -> R.drawable.character_1_1_2_2
            "1_2_1_1" -> R.drawable.character_1_2_1_1
            "1_2_1_2" -> R.drawable.character_1_2_1_2
            "1_2_2_1" -> R.drawable.character_1_2_2_1
            "1_2_2_2" -> R.drawable.character_1_2_2_2
            "2_1_1_1" -> R.drawable.character_2_1_1_1
            "2_1_1_2" -> R.drawable.character_2_1_1_2
            "2_1_2_1" -> R.drawable.character_2_1_2_1
            "2_1_2_2" -> R.drawable.character_2_1_2_2
            "2_2_1_1" -> R.drawable.character_2_2_1_1
            "2_2_1_2" -> R.drawable.character_2_2_1_2
            "2_2_2_1" -> R.drawable.character_2_2_2_1
            "2_2_2_2" -> R.drawable.character_2_2_2_2
            else -> R.drawable.character_1_1_1_1
        }
    }
}